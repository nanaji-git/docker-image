pipeline{

   agent any
   
   stages {
     stage("git scm") {
       steps {
           git 'https://github.com/nanaji-git/docker-image.git'
          }
       }
     stage("maven build") {
       steps{
          sh 'mvn clean package'
           }
           }
     stage("code analysis") {
       steps{
         script{
           withSonarQubeEnv(credentialsId: 'sonarkey') {
           sh 'mvn package sonar:sonar'
}
}           
}
    }
      stage("qgates") {
        steps{
          waitForQualityGate abortPipeline: false, credentialsId: 'sonarkey'
}
}
      stage("artifacts upload"){
        steps{
          script{
            nexusArtifactUploader artifacts:
            [
              [
                 artifactId: 'docker-image',
                 classifier: '',
                 file: 'target/hello-image.jar',
                 type: 'jar'
                   ]
                 ],
            credentialsId: 'c47be26f-1f83-40cd-bfc2-0aa57d898f84',
            groupId: 'com.dockeriamge',
            nexusUrl: '18.179.59.200:8081',
            nexusVersion: 'nexus3',
            protocol: 'http',
            repository: 'practice',
            version: '1.0'
         }
      }
 } 
 } 
}
