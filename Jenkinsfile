pipeline {
    agent {
        node {
            label 'Mac-mini'
            customWorkspace 'wrappers/flutter_document_reader'
        }
    }
    parameters {
        string(name: 'TYPE', defaultValue: 'Temp')
        string(name: 'BRANCH_NAME', defaultValue: 'develop')
        choice(name: 'SOURCE_TYPE', choices: ['Release', 'Temp', 'Nightly', 'Beta', 'Stage'])
        string(name: 'IOS_VERSION', defaultValue: '+')
        string(name: 'ANDROID_VERSION', defaultValue: '+')
        string(name: 'MAJOR_VERSION', defaultValue: '+')
        booleanParam(name: 'VERBOSE_LOGS', defaultValue: false)

        string(name: 'BUILD_SCRIPTS_BRANCH', defaultValue: 'master')
        choice(name: 'DR_CORE_MODULE_TYPE', choices: ['Release', 'Nightly', 'Beta', 'Stage', 'Temp'])
        string(name: 'DR_CORE_MODULE_VERSION', defaultValue: '+')
        choice(name: 'BTDEVICE_MODULE_TYPE', choices: ['Release', 'Nightly', 'Beta', 'Stage', 'Temp'])
        string(name: 'BTDEVICE_MODULE_VERSION', defaultValue: '+')
    }
    options {
        buildDiscarder logRotator(daysToKeepStr: '365', numToKeepStr: '1000')
        gitLabConnection gitLabConnection: 'Jenkins'
        disableConcurrentBuilds()
        checkoutToSubdirectory('build')
    }
    environment {
        GITHUB_TOKEN = credentials('GitHubToken')
        GITLAB_TOKEN = credentials('JenkinsToGitLab')
        PRIVATE_UPLOAD_FTP = credentials('temp-ftp')
        REGULA_USER = credentials('dc332ac9-d41f-423a-bf70-abc6428296ce')
        GITLAB_JENKINS_USER = '73241dae-24b0-4395-a6cd-3706a474635b'
    }
    stages {
        stage('Set Build name') {
            steps {
                script {
                    def LOGS_STRING = VERBOSE_LOGS.toBoolean() ? ' logs' : ''
                    buildName "#$BUILD_NUMBER $TYPE $BRANCH_NAME$LOGS_STRING"
                }
            }
        }
        stage('Build') {
            steps {
                dir('wrappers') {
                    checkout scmGit(
                        branches: [[name: "$BUILD_SCRIPTS_BRANCH"]], 
                        userRemoteConfigs: [[credentialsId: "$GITLAB_JENKINS_USER",
                        url: 'https://gitlab.regula.work/mobile-sdk/wrappers.git']])
                }
                sh '''
                source wrappers/.hidden/scripts/core.sh
                run ./update.sh
                '''
            }
        }
    }
}
