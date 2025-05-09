@Library('Shared') _ 

pipeline { 
    agent any 
    environment{ 
        SONAR_HOME = tool "Sonar" 
    } 

    parameters { 
        string(name: 'FRONTEND_DOCKER_TAG', defaultValue: '', description: 'Setting docker image for latest push') 
        string(name: 'BACKEND_DOCKER_TAG', defaultValue: '', description: 'Setting docker image for latest push') 
    } 

    stages { 
        stage("Validate Parameters") { 
            steps { 
                script { 
                    if (params.FRONTEND_DOCKER_TAG == '' || params.BACKEND_DOCKER_TAG == '') { 
                        error("FRONTEND_DOCKER_TAG and BACKEND_DOCKER_TAG must be provided.") 
                    } 
                } 
            } 
        } 

    stage("Workspace cleanup"){ 
        steps{ 
            script{ 
                cleanWs() 
            } 
        } 
    } 
        
    stage('Git: Code Checkout') { 
        steps { 
            script{ 
                code_checkout("https://github.com/vinayakz/TrekTales-vinayakz.git","main") 
            } 
        } 
    } 

    stage("Trivy: Filesystem scan"){ 
        steps{ 
            script{ 
                trivy_scan() 
            } 
        } 
    } 

    stage("OWASP: Dependency check"){ 
        steps{ 
            script{ 
                owasp_dependency() 
            } 
        } 
    } 

    stage("SonarQube: Code Analysis"){ 
        steps{ 
            script{ 
                sonarqube_analysis("Sonar","wanderlust","wanderlust") 
            } 
        } 
    } 

    stage("SonarQube: Code Quality Gates"){ 
        steps{ 
            script{ 
                sonarqube_code_quality() 
            } 
        } 
    } 

    stage('Exporting environment variables') { 
        parallel{ 
            stage("Backend env setup"){ 
                steps { 
                    script{ 
                        dir("Automations"){ 
                            sh "bash backendbash.sh" 
                        } 
                    } 
                } 
            } 
            stage("Frontend env setup"){ 
                steps { 
                    script{ 
                        dir("Automations"){ 
                            sh "bash frontendbash.sh" 
                        } 
                    } 
                } 
            } 
        } 
    } 

    stage("Docker: Build Images"){ 
        steps{ 
            script{ 
                dir('backend'){ 
                    dockerbuild("Trek-Tales-backend","${params.BACKEND_DOCKER_TAG}","vinayakz") 
                }
                dir('frontend'){ 
                    dockerbuild("Trek-Tales-frontend","${params.FRONTEND_DOCKER_TAG}","vinayakz") 
                } 
            } 
        } 
    } 

        stage("Docker: Push to DockerHub"){ 
            steps{ 
                script{ 
                    dockerpush("Trek-Tales-backend","${params.BACKEND_DOCKER_TAG}","vinayakz")  
                    dockerpush("Trek-Tales-frontend","${params.FRONTEND_DOCKER_TAG}","vinayakz") 
                } 
            } 
        } 
    } 

    post{ 
        success{ 
            archiveArtifacts artifacts: '*.xml', followSymlinks: false 
            build job: "Trek-Tales-CD", parameters: [ 
                string(name: 'FRONTEND_DOCKER_TAG', value: "${params.FRONTEND_DOCKER_TAG}"), 
                string(name: 'BACKEND_DOCKER_TAG', value: "${params.BACKEND_DOCKER_TAG}") 
            ] 
        }  
    } 
} 

 
