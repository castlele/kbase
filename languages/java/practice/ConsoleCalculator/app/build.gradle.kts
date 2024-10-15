plugins {
    application
}

repositories {
    mavenCentral()
}

dependencies {
    testImplementation(libs.junit.jupiter)

    testRuntimeOnly("org.junit.platform:junit-platform-launcher")

    implementation(libs.guava)
}

java {
    toolchain {
        languageVersion = JavaLanguageVersion.of(22)
    }
}

application {
    mainClass = "com.castlelecs.consolecalculator.App"
}

tasks.jar {
    manifest {
        attributes["Main-Class"] = application.mainClass
    }
}

tasks.named<Test>("test") {
    useJUnitPlatform()
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
