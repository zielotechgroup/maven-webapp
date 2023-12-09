pipeline {
    agent any
    
    tools {
      maven 'maven-3.9.6'
    }

    
    stages{
        
        stage('Checkout'){
            steps{
                git branch: 'main', credentialsId: 'git-repo-cred', url: 'https://github.com/zielotechgroup/maven-webapp.git'
            }
        }
        
        stage('Code build'){
            steps{
                sh 'mvn clean package'
            }
        }
        
        stage('Static Analysis'){
            steps{
                sh 'mvn checkstyle:checkstyle pmd:pmd'
                recordIssues(tools: [checkStyle(), pmdParser()])
            }
        }
        
        stage('Code coverage'){
            steps{
                jacoco maximumBranchCoverage: '80', maximumClassCoverage: '80', maximumComplexityCoverage: '80', maximumInstructionCoverage: '80', maximumLineCoverage: '80', maximumMethodCoverage: '80', minimumBranchCoverage: '80', minimumClassCoverage: '80', minimumComplexityCoverage: '80', minimumInstructionCoverage: '80', minimumLineCoverage: '80', minimumMethodCoverage: '80'
            }
        }
        
        stage('docker build & publish'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'docker-cred', passwordVariable: 'pwd', usernameVariable: 'uname')]) {
                    sh 'docker build -t nayakomprasad/jenkins-demo .'
                    sh 'docker login -u ${uname} -p dckr_pat_n-CZF0MfqpqU8CCuqjY5HhKxAVM'
                    sh 'docker push nayakomprasad/jenkins-demo'
                }
                
                
            }
        }
        
    }
    
}
