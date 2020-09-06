pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven"
    }

    stages {
        stage('preparation') {
            steps {
                git 'https://github.com/ChaitanyaReddy-dev/eureka-config-server-example.git'
            }
        }
        stage('build'){
            steps {
			echo 'cleaning target directory'
            sh 'mvn clean'
            }
        }
        stage('build jar'){
            steps{
				echo 'building jar'
                sh 'mvn install'
            }
        }
		stage('build docker image'){
			steps{
			sh '''#!/bin/bash
			  echo 'inside bash'
			  echo 'building docker image'
			  cd /var/lib/jenkins/workspace/eureka
			  cp /var/lib/jenkins/workspace/eureka/target/demo-0.0.1-SNAPSHOT.jar /var/lib/jenkins/workspace/eureka
			  sudo docker build -t discovery .
			 '''
			}
		}
		stage('Run dokcer image'){
			steps{
			sh '''#!/bin/bash
			echo 'running docker image'
		    sudo docker run -p 8000:8090 discovery
			echo 'application deployed'
			'''
			}
		}
    }
}
