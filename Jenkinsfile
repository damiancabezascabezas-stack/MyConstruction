
pipeline {
    agent any

    tools {
        jdk 'JDK17'
        maven 'Maven3'
    }

    stages {

        stage('Verificar entorno') {
            steps {
                bat 'java -version'
                bat 'mvn -version'
            }
        }

        stage('Compilar proyecto') {
            steps {
                bat 'mvn -B clean compile'
            }
        }

        stage('Ejecutar pruebas') {
            steps {
                bat 'mvn -B test'
            }
        }

        stage('Generar artefactos') {
            steps {
                bat 'mvn -B package -DskipTests'
            }
        }

        stage('Archivar artefactos') {
            steps {
                archiveArtifacts(
                    artifacts: 'target/*.war,target/*.jar',
                    fingerprint: true,
                    allowEmptyArchive: false
                )
            }
        }
    }

    post {
        success {
            echo 'MyConstruction compilado correctamente.'
        }

        failure {
            echo 'Error durante la compilacion de MyConstruction.'
        }
    }
}
