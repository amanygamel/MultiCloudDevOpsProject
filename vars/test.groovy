def runUnitTests() {
    // Your unit test logic here
    sh 'chmod +x ./gradlew'
    sh './gradlew test'
}
