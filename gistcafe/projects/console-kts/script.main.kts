#!/usr/bin/env kotlin

@file:Repository("https://jcenter.bintray.com")
@file:DependsOn("com.google.code.gson:gson:2.8.6")
@file:DependsOn("net.servicestack:gistcafe:0.0.6")

import java.net.URL
import com.google.gson.*
import com.google.gson.annotations.SerializedName
import net.servicestack.gistcafe.*

data class GithubRepo(
    val name: String,
    val description: String = "",
    val homepage: String = "",
    @SerializedName("language") val lang: String = "",
    val watchers: Int,
    val forks: Int)

val orgName = "Kotlin"
val json = URL("https://api.github.com/orgs/$orgName/repos").readText()
val orgRepos = Gson().fromJson<List<GithubRepo>>(json)
    .sortedByDescending { it.watchers }

println("Top 3 $orgName GitHub Repos:")
Inspect.printDump(orgRepos.take(3))

println("\nTop 10 $orgName GitHub Repos:")
Inspect.printDumpTable(orgRepos.take(10), 
    listOf("name","language","watchers","forks"))

Inspect.vars(mapOf("orgRepos" to orgRepos))