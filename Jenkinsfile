pipeline {
    agent any
    stages {
        stage ('SCM checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/sudnyata/repoProject.git'
            }
        }
        stage ('docker image build') {
            steps {
                sh'/usr/bin/docker image build -t sudnyata/imgproj .'
            }
        }
        stage ('docker login') {
            steps {
                sh 'echo dckr_pat_ov8AEnxv9o0MBBYoFb_8Ivu5vT4 | /usr/bin/docker login -u sudnyata --password-stdin'
            }
        }
        stage ('docker image push') {
            steps {
                sh '/usr/bin/docker image push sudnyata/imgproj'
            }
        }
        stage ('get the confirmation from user') {
            steps {
                input 'Do you want to deploy this application?'
            }
        }
        stage ('remove existing service') {
            steps {
                sh '/usr/bin/docker service rm serviceproj'
            }
        }
        stage ('create docker service') {
            steps {
                sh '/usr/bin/docker service create --name serviceproj -p 5000:5000 --replicas 2 sudnyata/imgproj'
            }
        }
    }
}

