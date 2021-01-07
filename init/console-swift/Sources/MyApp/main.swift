import Foundation
import FoundationNetworking
import gistcafe

struct GitHubRepo : Codable {
  let name: String
  let description: String?
  let language: String?
  let watchers: Int
  let forks: Int
}

let orgName = "apple"

if let url = URL(string: "https://api.github.com/orgs/\(orgName)/repos") {
    let sem = DispatchSemaphore.init(value: 0)

    URLSession.shared.dataTask(with: url) { data, response, error in
        defer { sem.signal() }
        if let data = data {
            do {
                let orgRepos = try JSONDecoder().decode([GitHubRepo].self, from: data)
                    .sorted { $0.watchers > $1.watchers }

                print("Top 3 \(orgName) GitHub Repos:")
                Inspect.printDump(Array(orgRepos.prefix(3)))

                print("\nTop 10 \(orgName) GitHub Repos:")
                Inspect.printDumpTable(Array(orgRepos.prefix(10)), 
                    columns:["name","language","watchers","forks"])

                Inspect.vars(["orgRepos":orgRepos])
            } catch let error {
                print(error)
            }
        }
    }.resume()

  sem.wait()
}

