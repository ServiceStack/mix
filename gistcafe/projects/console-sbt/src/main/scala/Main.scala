import com.google.gson.Gson
import net.servicestack.gistcafe._
import java.net.URL
import scala.jdk.CollectionConverters._

class GithubRepo(
   val name: String,
   val description: String = "",
   val homepage: String = "",
   val language: String = "",
   val watchers: Int,
   val forks: Int)

object Main extends App {

  val orgName = "scala"

  val json = Inspect.readUrlAsText(
    new URL(s"https://api.github.com/orgs/${orgName}/repos"))

  val orgRepos = new Gson().fromJson(json, classOf[Array[GithubRepo]])
    .sortBy(_.watchers)(Ordering[Int].reverse)

  println(s"Top 3 ${orgName} GitHub Repos:")
  Inspect.printDump(orgRepos.take(3))

  println(s"\nTop 10 ${orgName} GitHub Repos:")
  Inspect.printDumpTable(orgRepos.take(10).toList.asJavaCollection, 
    List("name", "language", "watchers", "forks").asJavaCollection)

  Inspect.vars(Map("orgRepos" -> orgRepos).asJava)
}