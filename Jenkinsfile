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
            nexusUrl: '18.176.93.24:8081',
            nexusVersion: 'nexus3',
            protocol: 'http',
            repository: 'practice',
            version: '1.0'
         }
      }
 } 
      stage("docker build"){
         steps {
            script{ 
            sh 'docker image build -t $JOB_NAME:v1.$BUILD_ID .'
            sh 'docker image tag $JOB_NAME:v1.$BUILD_ID nanajiseelam/$JOB_NAME:v1.$BUILD_ID'
            sh 'docker image tag $JOB_NAME:v1.$BUILD_ID nanajiseelam/$JOB_NAME:latest'
         }
      }      
 } 
      stage("docker image push") {
         steps {
           withCredentials([string(credentialsId: 'docker-key', variable: 'docker')]) {
             sh 'docker login -u nanajiseelam -p ${docker}'
             sh 'docker image push nanajiseelam/$JOB_NAME:v1.$BUILD_ID' 
}
         }
      }
}
}
