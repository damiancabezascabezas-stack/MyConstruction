pipeline {
    agent any

    tools {
        jdk 'JDK17'
        maven 'Maven'
    }

    environment {
        ARTIFACTORY_URL = 'http://localhost:8082/artifactory'
        ARTIFACTORY_REPO = 'myconstruction-libs-snapshot'
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

        stage('Publicar JAR en Artifactory') {
            steps {
                withCredentials([
                    string(
                        credentialsId: 'artifactory-token',
                        variable: 'ARTIFACTORY_TOKEN'
                    )
                ]) {
                    powershell '''
                        $ErrorActionPreference = 'Stop'

                        $jar = Get-ChildItem -Path 'target' `
                            -Filter '*-classes.jar' |
                            Select-Object -First 1

                        if (-not $jar) {
                            throw 'No se encontro el archivo JAR.'
                        }

                        $destino = "$env:ARTIFACTORY_URL/" +
                            "$env:ARTIFACTORY_REPO/" +
                            "cl/myconstruction/MyConstruction/" +
                            "1.0-SNAPSHOT/" +
                            $jar.Name

                        $headers = @{
                            Authorization = "Bearer $env:ARTIFACTORY_TOKEN"
                        }

                        Invoke-RestMethod `
                            -Uri $destino `
                            -Method Put `
                            -Headers $headers `
                            -InFile $jar.FullName `
                            -ContentType 'application/java-archive'

                        Write-Host 'JAR publicado en Artifactory.'
                    '''
                }
            }
        }
    }

    post {
        success {
            echo 'MyConstruction compilado y publicado correctamente.'
        }

        failure {
            echo 'Error durante el pipeline de MyConstruction.'
        }
    }
}