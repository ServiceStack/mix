import { Inspect } from "https://deno.land/x/gistcafe@v1.0.0/Inspect.ts";

let orgName = "denoland";

let orgRepos = (await (await fetch(`https://api.github.com/orgs/${orgName}/repos`)).json())
    .map((x:any) => ({
        name: x.name,
        description: x.description,
        lang: x.language,
        watchers: x.watchers_count,
        forks: x.forks
    }));

orgRepos.sort((a:any, b:any) => b.watchers - a.watchers);

console.log(`Top 3 ${orgName} Github Repos:`);
Inspect.printDump(orgRepos.slice(0, 3));

console.log(`\nTop 10 ${orgName} Github Repos:`);
Inspect.printDumpTable(orgRepos.map((x:any) => ({
    name: x.name, lang: x.lang, watchers: x.watchers, forks: x.forks
})).slice(0, 10));

Inspect.vars({ orgRepos });
