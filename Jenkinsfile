pipeline{
	agent{label 'master'}
	stages{
		stage('test vault'){
			steps{
				script {
					def secrets = [
						[path: 'secret/another_test', engineVersion: 2, secretValues: [
						    [vaultKey: 'SECRET_KEY']
						]]
					]
					withVault([vaultSecrets: secrets]) {
						sh 'echo $SECRET_KEY'
					}
				}
			}
		}
		stage('Checkout'){
			steps{
				git branch: 'vault', url: 'https://github.com/DuyTungHa/Media99.git'
			}
		}
    		stage('Setup'){
      			steps{
				sh 'chmod +x install.sh'
        			sh './install.sh'
      			}
    		}
    		stage('Test'){
      			steps{
				 sh '''#!/bin/bash
				     source myprojectenv/bin/activate	
                		     python -m unittest
				     '''
               			}
   		}
		stage('invoke playbook'){
      			steps{
				ansiblePlaybook credentialsId: 'UbuntuID1', disableHostKeyChecking: true, inventory: '/etc/ansible/hosts', installation: 'A1', playbook: './app_playbook.yml', vaultCredentialsId: 'VaultID1'               			
			}
   		}
	}
}
