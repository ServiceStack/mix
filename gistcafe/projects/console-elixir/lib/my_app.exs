org_name = "elixir-lang"

"https://api.github.com/orgs/#{org_name}/repos"
|> HTTPoison.get([ "User-Agent": "gist.cafe" ])
|> case do
    {:ok, %{body: raw_body, status_code: code}} -> {code, raw_body}
    {:error, %{reason: reason}} -> {:error, reason}
  end
|> (fn {_, body} ->

  org_repos = Jason.decode!(body)
  |> Enum.map(fn (x) -> %{
    name:        x["name"],
    description: x["description"],
    url:         x["url"],
    lang:        x["language"],
    watchers:    x["watchers"],
    forks:       x["forks"]
  } end)
  |> Enum.sort_by(&(&1.watchers))
  |> Enum.reverse

  IO.puts "Top 3 #{org_name} GitHub Repos:"
  org_repos |> Enum.take(3) |> Inspector.print_dump

  IO.puts "\nTop 10 #{org_name} GitHub Repos:"
  Enum.take(org_repos, 7)
  |> Inspector.print_dump_table([:name, :lang, :watchers, :forks])

end).()
