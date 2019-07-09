pipeline 
{
	agent any
	stages
	{
		stage('Build')
		{
			steps
			{
				withEnv(['PATH+MVN=/home/ec2-user/apache-maven-3.6.1/bin:/usr/java/jdk1.8.0_211-amd64/bin'])                    
		                {
					sh 'mvn clean package'
				}
			}
			post
			{
				success 
				{
					echo 'Now Archiving...'
					archiveArtifacts artifacts: '**/target/*.war'
				}
			}
		}
		stage('Deploy to Staging')
		{
			steps
			{
				echo 'Deploy to Staging'
				build job: 'maven-project-staging-deploy'
			}
		}
		stage('Deploy to Production')
		{	
			steps
                        {
				timeout(time:5, unit:'DAYS')
				{
					input message: 'Approve Production Deployment?'
				}

				build job: 'maven-project-production-deploy'
			}
			post
			{
				success
				{
					echo 'Code Deployed to Production'
				}
				failure
				{
					echo 'Deployment failed'
				}
			}

                }

	}
}
