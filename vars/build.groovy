def buildDockerImage(String dockerRegistry, String imageName, String imageTag) {
    // Your Docker image build logic here
    sh "echo 'Amany*2023' | gpg --passphrase-fd 0 --batch --yes --no-tty --symmetric --cipher-algo AES256 --output /var/lib/jenkins/.docker/config.json.gpg /var/lib/jenkins/.docker/config.json"
    sh "echo 'Amany*2023' | docker login -u ${dockerRegistry} --password-stdin"
    sh 'chmod +x gradlew'
    sh "docker build -t ${dockerRegistry}:${imageTag} ."
    sh "docker tag ${dockerRegistry}:${imageTag} docker.io/${dockerRegistry}/${imageName}:${imageTag}"
}
