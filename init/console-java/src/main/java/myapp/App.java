package myapp;

import com.google.gson.Gson;
import com.google.gson.annotations.SerializedName;
import com.google.gson.reflect.TypeToken;
import net.servicestack.gistcafe.Inspect;

import java.io.IOException;
import java.net.URL;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

class GithubRepo {
    public String name;
    public String description = "";
    public String homepage = "";
    @SerializedName("language") public String lang = "";
    public Integer watchers = 0;
    public Integer forks = 0;
}

public class App {

    public static void main(String[] args) throws IOException {

        String orgName = "openjdk";

        String json = Inspect.readUrlAsText(new URL("https://api.github.com/orgs/" + orgName + "/repos"));

        List<GithubRepo> orgRepos = new Gson().fromJson(json, new TypeToken<List<GithubRepo>>(){}.getType());
        orgRepos.sort((a,b) -> b.watchers.compareTo(a.watchers));

        System.out.println("Top 3 " + orgName + " GitHub Repos:");
        Inspect.printDump(orgRepos.subList(0,3));

        System.out.println("\nTop 10 " + orgName + " GitHub Repos:");
        String[] headers = { "name","language","watchers","forks" };
        Inspect.printDumpTable(orgRepos.subList(0, 10), Arrays.asList(headers));

        Inspect.vars(new HashMap<String, Object>() {{
            put("orgRepos", orgRepos);
        }});
    }
}
