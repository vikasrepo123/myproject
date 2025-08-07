pipeline {
    agent any

    environment {
        IMAGE_NAME = "hello-world-tomcat"
        CONTAINER_NAME = "mytomcat"
        PORT = "9010"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main',
                    credentialsId: 'MyGithub',
                    url: 'https://github.com/vikasrepo123/hello-world.git'
            }
        }

        stage('Build WAR') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('mysonar') {
                    sh 'mvn sonar:sonar'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Run Tomcat Container') {
            steps {
                sh """
                    docker rm -f ${CONTAINER_NAME} || true
                    docker run -d --name ${CONTAINER_NAME} -p ${PORT}:8080 ${IMAGE_NAME}
                """
            }
        }
    }

    post {
        success {
            echo "✅ Application deployed successfully at http://localhost:${PORT}/hello-world"
        }
        failure {
            echo "❌ Deployment failed! Check logs."
        }
    }
}

