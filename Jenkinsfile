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
    }
 }