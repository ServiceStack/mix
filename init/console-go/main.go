package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"sort"

	"github.com/servicestack/gistcafe-go/inspect"
)

type GithubRepo struct {
	Name        string `json:"name"`
	Description string `json:"description"`
	Url         string `json:"url"`
	Homepage    string `json:"homepage"`
	Lang        string `json:"language"`
	Watchers    int    `json:"watchers_count"`
	Forks       int    `json:"forks"`
}

func main() {
	orgName := "golang"
	url := fmt.Sprintf("https://api.github.com/orgs/%s/repos", orgName)
	client := http.Client{}
	req, err := http.NewRequest(http.MethodGet, url, nil)
	if err != nil {
		log.Fatal(err)
	}
	req.Header.Set("User-Agent", "gist.cafe")
	res, getErr := client.Do(req)
	if getErr != nil {
		log.Fatal(getErr)
	}
	defer res.Body.Close()

	body, readErr := ioutil.ReadAll(res.Body)
	if readErr != nil {
		log.Fatal(readErr)
	}

	var orgRepos []GithubRepo
	jsonErr := json.Unmarshal(body, &orgRepos)
	if jsonErr != nil {
		log.Fatal(jsonErr)
	}

	sort.Slice(orgRepos, func(i, j int) bool {
		return orgRepos[i].Watchers > orgRepos[j].Watchers
	})

	inspect.PrintDump(orgRepos[0:3])

	inspect.TableOptions{Headers: []string{"Name", "Lang", "Watchers", "Forks"}}.PrintDumpTable(orgRepos[0:10])

	inspect.Vars(map[string]interface{}{"orgRepos": orgRepos})
}
