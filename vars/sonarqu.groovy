def runSonarQubeAnalysis() {
    // Your SonarQube analysis logic here
    withSonarQubeEnv('sonar') {
        sh "chmod +x ./gradlew" // Ensure that the build script is executable
        sh "./gradlew sonarqube --stacktrace"
    }
}
