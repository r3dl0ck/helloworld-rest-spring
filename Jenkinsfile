pipeline {
    agent { label 'dockerhost-label' }
    tools {
       maven 'maven-3.9.6'
    }
    stages {
        stage('Test') {
            steps {
                    sh 'echo Testing..'
            }
        }
        stage('Compile') {
            steps {
                    sh 'mvn package'
            }
        }
        stage('Docker build and push ') {
            steps {
                    sh '''
                    docker build . -t localhost:5000/helloworld-spring
                    docker tag localhost:5000/helloworld-spring localhost:5000/helloworld-spring:${BUILD_NUMBER}
                    docker push localhost:5000/helloworld-spring:${BUILD_NUMBER}
                    '''
            }
        }
        stage('Deploy') {
            steps {
                    input message: 'Confirm to deploy new app version? (Click "Proceed" to continue)'
                    sh '''
                    docker rm -f helloworld-spring
                    docker run -d --name helloworld-spring -p 9001:8080 localhost:5000/helloworld-spring:${BUILD_NUMBER}
                    '''
            }
        }
    }
    post {
        success {
            echo 'echo "Web APP available on http://192.168.56.11:9001/hello"'
        }
    }
}
