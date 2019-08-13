{{#markdown}}
## [ServiceStack](https://github.com/ServiceStack) GitHub Repos
{{/markdown}}

```code
"https://api.github.com/orgs/ServiceStack/repos" | urlContentsWithCache({userAgent:'#Script'}) | to => json

json  | parseJson | to => repos

repos | orderByDesc => it.stargazers_count | to => popularRepos

popularRepos | take(5) | map => { it.full_name, it.watchers, it.forks } | htmlDump({caption:'Top 5'})
```

Total Stars: {{repos | map => it.stargazers_count | sum}}



ServiceStack GitHub Repos

```code
"https://api.github.com/orgs/ServiceStack/repos" | urlContentsWithCache({userAgent:'#Script'}) | to => json

json  | parseJson | to => repos

repos | orderByDesc => it.stargazers_count | to => popularRepos

popularRepos | take(10) | map => { it.full_name, it.watchers, it.forks } | textDump({caption:'Top 10'})
```

Total Stars: {{repos | map => it.stargazers_count | sum}}