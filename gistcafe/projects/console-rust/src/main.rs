extern crate gistcafe;
extern crate serde_json;
use std::*;
use serde_json::*;
use gistcafe::inspect::*;

#[tokio::main]
async fn main() {
    let org_name = "rust-lang";
    let res = reqwest::Client::new()
        .get(&format!("https://api.github.com/orgs/{}/repos",org_name))
        .header(reqwest::header::USER_AGENT, "gist.cafe")
        .send().await.unwrap();

    let json: Vec<Map<String,Value>> = res.json().await.unwrap();
    let mut org_repos: Vec<Map<String,Value>> = Vec::new();
    for x in json.iter() {
        org_repos.push(json!({
            "name":        x["name"],
            "description": x["description"],
            "lang":        x["language"],
            "watchers":    x["watchers"],
            "forks":       x["forks"],
        }).as_object().unwrap().clone());
    }
    org_repos.sort_by(|a, b| 
        b["watchers"].as_i64().cmp(&a["watchers"].as_i64()));
    
    println!("Top 3 {} GitHub Repos:", org_name);
    print_dump(&org_repos[1..=3]);

    println!("\nTop 10 {} GitHub Repos:", org_name);
    print_dump_table_columns(&org_repos[1..=10].to_vec(), 
        vec!["name", "lang", "watchers", "forks"]);

    vars(&json!({ "org_repos": org_repos }));
}