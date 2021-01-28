require 'json'
require 'net/http'
require 'gistcafe'

org_name = "ruby"
uri = URI.parse("https://api.github.com/orgs/#{org_name}/repos")

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = (uri.scheme == 'https')
http.verify_mode = OpenSSL::SSL::VERIFY_NONE    
req = Net::HTTP::Get.new(uri.request_uri)
req["User-Agent"] = "gist.cafe"

res = http.request(req)
org_repos = JSON.parse(res.body).map {|x| { 
    name:        x['name'], 
    description: x['description'], 
    lang:        x['language'], 
    watchers:    x['watchers'], 
    forks:       x['forks'] 
} }.sort_by { |x| -x[:watchers] }

puts "Top 3 #{org_name} GitHub Repos:"
Inspect.print_dump(org_repos.take(3))

puts "\nTop 10 #{org_name} GitHub Repos:"
Inspect.print_dump_table(org_repos.take(10).map {|x| { 
    name:     x[:name], 
    lang:     x[:lang], 
    watchers: x[:watchers], 
    forks:    x[:forks], 
}})

Inspect.vars({ org_repos:org_repos })