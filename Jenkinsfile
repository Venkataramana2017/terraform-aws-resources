#!groovy​

// Terraform apply or plan via the Makefile
def TerraApply(String LayerToDeploy, String Environment, String TerraAction) {
    // force all non apply requests to plan
    // if (TerraAction != 'apply') {
    //     TerraAction = 'plan'
    // }
    sh """
        set +x
        LAYER=${LayerToDeploy} WORKSPACE=${Environment} make first-run
        LAYER=${LayerToDeploy} WORKSPACE=${Environment} make init
        LAYER=${LayerToDeploy} WORKSPACE=${Environment} make ${TerraAction}
        """
}
pipeline {	
	agent any 
    parameters {
        booleanParam(name: '_1_Network', defaultValue: false, description: 'Apply network layer')
        booleanParam(name: '_2_Launch_template_ec2', defaultValue: false, description: 'launch template ec2 creation')
	    booleanParam(name: '_3_Security_group', defaultValue: false, description: 'security group creation')
        choice(name: 'Environment', choices: 'dev\ntest', description: 'Select Environment')
        choice(name: 'Action', choices: 'plan\napply\nplan-destroy\napply-destroy', description: 'Select Action')
    }
    stages {
        stage('Download module Repositories') {
            steps {
                dir ('module') {
                    checkout([
                        $class: 'GitSCM', branches: [[name: '*/main']],
                        extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'terraform-aws-resources-module']],
                        userRemoteConfigs: [[ url:  'https://gitlab.com/bvramana2000/terraform-aws-resources-module.git',
                        credentialsId:  'git_credentials']]
                    ])
                }
            }
        }
        stage('Network') {
			when { expression { params._1_Network == true } }
            steps{
                script {
                    TerraApply("1_Network", params.Environment, params.Action)
                } 
            }
		 }
         stage('Launch_template_ec2') {
			when { expression { params._2_Launch_template_ec2 == true } }
            steps{
                script {
                    TerraApply("2_Launch_template_ec2", params.Environment, params.Action)
                }
            }
		 }
        stage('Security_group') {
			when { expression { params._3_Security_group == true } }
            steps{
                script {
                    TerraApply("3_Security_group", params.Environment, params.Action)
                         }
                     }
		        }
      
    }//stages
}//pipeline
