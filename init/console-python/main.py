import requests
import operator

from dataclasses import dataclass, field
from dataclasses_json import config, dataclass_json, Undefined
from typing import Optional
from gistcafe import inspect

@dataclass_json(undefined=Undefined.EXCLUDE)
@dataclass
class GithubRepo:
    name: str
    description: Optional[str] = None
    homepage: Optional[str] = None
    lang: Optional[str] = field(metadata=config(field_name="language"),default=None)
    watchers: Optional[int] = 0
    forks: Optional[int] = 0

orgName = "python"
response = requests.get(f'https://api.github.com/orgs/{orgName}/repos')
orgRepos = GithubRepo.schema().loads(response.text, many=True)
orgRepos.sort(key=operator.attrgetter('watchers'), reverse=True)

print(f'Top 3 {orgName} Repos:')
inspect.printdump(orgRepos[0:3])

print(f'\nTop 10 {orgName} Repos:')
inspect.printdumptable(orgRepos[0:10],headers=['name','lang','watchers','forks'])

inspect.vars({ 'orgRepos': orgRepos })