#!/usr/bin/env bash
# Assign NetCoreTemplates directory
export NETCORE_TEMPLATES_DIR=../../NetCoreTemplates
export SHOULD_BRANCH=1
export START_DIR=$(pwd)
# Declare three lists of template names
# Templates with DB migrations, array of strings
export TEMPLATES_WITH_MIGRATIONS=(
    "blazor"
    "blazor-vue"
#    "blazor-wasm"
#    "vue-mjs"
#    "mvc-tailwind"
)
# Templates without DB migrations, array of strings
export TEMPLATES_WITHOUT_MIGRATIONS=(
#    "angular-spa"
#    "aurelia-spa"
#    "react-spa"
#    "svelte-spa"
#    "vue-nuxt"
#    "vue-spa"
#    "vuetify-nuxt"
#    "vuetify-spa"
#    "web-tailwind"
#    "mvcauth"
#    "mvc"
#    "razor-pages"
#    "razor-tailwind"
#    "parcel"
#    "razor"
#    "script"
#    "web"
)
# Templates that use CDN/API split, array of strings
export TEMPLATES_FOR_CDN=(
#    "nextjs"
#    "vue-vite"
#    "vue-ssg"
)
# Copy the folder `actions/dotnet-docker-db` for the templates with DB migrations using the list of template names
# and the variable NETCORE_TEMPLATES_DIR. Combine to create a path to the template folder, and then copy the folder.
# Ensure to overwrite the folder if it already exists in the target templates.
for i in "${TEMPLATES_WITH_MIGRATIONS[@]}"
do
    # If SHOULD_BRANCH is set to 1, create a new git branch for the template
    if [ "$SHOULD_BRANCH" -eq 1 ]; then
        cd "$NETCORE_TEMPLATES_DIR/$i"
        git checkout -b "sync-gh-actions"
        cd "$START_DIR"
    fi
    cp -r actions/dotnet-docker-db "$NETCORE_TEMPLATES_DIR/$i"
    # If SHOULD_BRANCH is set to 1, commit the changes and push to the remote
    if [ "$SHOULD_BRANCH" -eq 1 ]; then
        cd "$NETCORE_TEMPLATES_DIR/$i"
        git add .
        git commit -m "Sync GitHub Actions"
        git push origin "sync-gh-actions"
        cd "$START_DIR"
    fi
done
# Copy the folder `actions/dotnet-docker` for the templates without DB migrations using the list of template names
# and the variable NETCORE_TEMPLATES_DIR. Combine to create a path to the template folder, and then copy the folder.
# Ensure to overwrite the folder if it already exists in the target templates.
for i in "${TEMPLATES_WITHOUT_MIGRATIONS[@]}"
do
    # If SHOULD_BRANCH is set to 1, create a new git branch for the template
    if [ "$SHOULD_BRANCH" -eq 1 ]; then
        cd "$NETCORE_TEMPLATES_DIR/$i"
        git checkout -b "sync-gh-actions"
        cd "$START_DIR"
    fi
    cp -r actions/dotnet-docker "$NETCORE_TEMPLATES_DIR/$i"
    # If SHOULD_BRANCH is set to 1, commit the changes and push to the remote
    if [ "$SHOULD_BRANCH" -eq 1 ]; then
        cd "$NETCORE_TEMPLATES_DIR/$i"
        git add .
        git commit -m "Sync GitHub Actions"
        git push origin "sync-gh-actions"
        cd "$START_DIR"
    fi
done
# Copy the folder `actions/dotnet-docker-cdn` for the templates with CDN/API split using the list of template names
# and the variable NETCORE_TEMPLATES_DIR. Combine to create a path to the template folder, and then copy the folder.
# Ensure to overwrite the folder if it already exists in the target templates.
for i in "${TEMPLATES_FOR_CDN[@]}"
do
    # If SHOULD_BRANCH is set to 1, create a new git branch for the template
    if [ "$SHOULD_BRANCH" -eq 1 ]; then
        cd "$NETCORE_TEMPLATES_DIR/$i"
        git checkout -b "sync-gh-actions"
        cd "$START_DIR"
    fi
    cp -r actions/dotnet-docker-cdn "$NETCORE_TEMPLATES_DIR/$i"
    # If SHOULD_BRANCH is set to 1, commit the changes and push to the remote
    if [ "$SHOULD_BRANCH" -eq 1 ]; then
        cd "$NETCORE_TEMPLATES_DIR/$i"
        git add .
        git commit -m "Sync GitHub Actions"
        git push origin "sync-gh-actions"
        cd "$START_DIR"
    fi
done

