plugins {
    java
    maven
    application
    kotlin("jvm") version "1.4.21"
}

group = "org.myapp"
version = "1.0-SNAPSHOT"

application {
    mainClass.set("org.myapp.AppKt")
}

repositories {
    mavenCentral()
}

tasks.test {
    useJUnitPlatform()
}

dependencies {
    implementation(kotlin("stdlib"))
    implementation("com.google.code.gson:gson:2.8.6")
    implementation("net.servicestack:gistcafe:0.0.5")
    testImplementation(platform("org.junit:junit-bom:5.7.0"))
    testImplementation("org.junit.jupiter:junit-jupiter")
}
