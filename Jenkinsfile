pipeline {
    agent any
     tools {
           maven "maven"
     }
      stages {
        stage('cleanUp') {
            steps {
                deleteDir()
                  }
        }
        stage('Checkout SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/medsrc/projet-CI-build-maven.git'
                  }
        }
         stage('Build') {
             steps {
                    sh "mvn clean install"
                    sh 'mkdir lib'
                    sh 'cd lib/ ; wget https://repo1.maven.org/maven2/org/junit/platform/junit-platform-console-standalone/1.7.0/junit-platform-console-standalone-1.7.0-all.jar'
                    sh 'cd src ; javac -cp "../lib/junit/platform/junit-platform-console-standalone/1.7.0/junit-platform-console-standalone-1.7.0-all.jar" src site.xml pom.xml'
                   }
       }
         stage('test') {
             steps {
                    sh 'cd src/ ; java -jar ../lib/junit/platform/junit-platform-console-standalone/1.7.0/junit-platform-console-standalone-1.7.0-all.jar -cp "." --select-class src --reports-dir="reports"'
                   }
       }
      
      }
}
