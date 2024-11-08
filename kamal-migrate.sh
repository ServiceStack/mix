#!/bin/bash

# Exit on error
set -e

# Function to validate input parameters
validate_input() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 <github-org> <repo-name>"
        exit 1
    fi
}

# Function to determine default branch
get_default_branch() {
    # Check if main exists
    if git show-ref --verify --quiet refs/remotes/origin/main; then
        echo "main"
    # Check if master exists
    elif git show-ref --verify --quiet refs/remotes/origin/master; then
        echo "master"
    else
        echo "Error: Neither 'main' nor 'master' branch found"
        exit 1
    fi
}

# Function to clone or update repository
setup_repository() {
    local org=$1
    local repo=$2
    local project_path=~/projects/$org/$repo

    if [ ! -d "$project_path" ]; then
        echo "Cloning repository..."
        mkdir -p ~/projects/$org
        git clone "git@github.com:$org/$repo.git" "$project_path"
        cd "$project_path"
        local default_branch=$(get_default_branch)
        git checkout "$default_branch"
    else
        echo "Repository exists, fetching latest..."
        cd "$project_path"
        git fetch origin
        local default_branch=$(get_default_branch)
        git checkout "$default_branch"
        git pull origin "$default_branch"
    fi

    cd "$project_path"
}

# Function to create and switch to new branch
create_branch() {
    local branch_name="feature/kamal-deployment"
    echo "Creating branch: $branch_name"
    git checkout -b "$branch_name" 2>/dev/null || git checkout "$branch_name"
}

# Function to update project file
update_project_file() {
    local repo=$1
    local csproj_file="MyApp/MyApp.csproj"

    if [ ! -f "$csproj_file" ]; then
        echo "Error: Project file not found at $csproj_file"
        exit 1
    fi

    echo "Updating project file..."
    # Create temporary file
    local temp_file=$(mktemp)

    # Replace the content - first removing any existing ContainerLabel entries, then adding the new one
    awk '
        # Skip existing ContainerLabel ItemGroup blocks
        /<ItemGroup>/{
            p = 1
            if (getline line > 0) {
                if (line ~ /ContainerLabel/) {
                    while (getline > 0 && !/<\/ItemGroup>/) { }
                    next
                } else {
                    print
                    print line
                }
            }
            next
        }
        /<\/ItemGroup>/ && p {
            p = 0
            print
            next
        }
        # Add new ContainerLabel after PublishProfile
        /<PublishProfile>DefaultContainer<\/PublishProfile>/ {
            print $0
            print "    </PropertyGroup>\n"
            print "    <ItemGroup>"
            print "        <ContainerLabel Include=\"service\" Value=\"my-app\" />"
            print "    </ItemGroup>"
            next
        }
        /<\/PropertyGroup>/ && !done {
            done=1
            next
        }
        {print}
    ' "$csproj_file" > "$temp_file"

    # Replace original file
    mv "$temp_file" "$csproj_file"

    # Remove existing `.deploy` folder
    rm -rf .deploy

    # Remove old readme in github workflows
    rm -rf .github/workflows/README.md
}

# Function to mix Kamal template
mix_kamal() {
    echo "Running x mix kamal..."
    x mix -name MyApp kamal
}

# Function to commit and push changes
commit_changes() {
    local branch_name="feature/kamal-deployment"
    echo "Committing changes..."
    git add .
    git commit -m "feat: add Kamal deployment configuration" || true
    git push -u origin "$branch_name"
}

# Function to set GitHub secrets
set_github_secrets() {
    local org=$1
    local repo=$2

    echo "Setting GitHub secrets..."
    gh secret set KAMAL_DEPLOY_HOST --body "$repo.web-templates.io" --repo "$org/$repo"
}

# Main execution
main() {
    local github_org=$1
    local repo_name=$2

    validate_input "$@"
    setup_repository "$github_org" "$repo_name"
    create_branch
    mix_kamal
    update_project_file "$repo_name"
    commit_changes
    set_github_secrets "$github_org" "$repo_name"

    echo "Migration completed successfully!"
}

# Execute main function with all arguments
main "$@"