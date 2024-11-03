plugins {
    application
}

repositories {
    mavenCentral()
}

dependencies {
    implementation(libs.guava)
    implementation(libs.json)
}

java {
    toolchain {
        languageVersion = JavaLanguageVersion.of(22)
    }
}

application {
    mainClass = "com.castlelecs.consoleforecast.App"
}

tasks.jar {
    manifest {
        attributes["Main-Class"] = application.mainClass
    }
}

tasks.register("printJar") {
    group = "Application"
    description = "Creates JAR and prints the command to run it"

    dependsOn(tasks.jar)

    doLast {
        val jarFile = tasks.getByName("jar").outputs.files.singleFile

        println("java -jar ${jarFile.path}")
    }
}
