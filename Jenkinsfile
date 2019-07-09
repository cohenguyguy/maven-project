pipeline 
{
	agent any

	tools
	{
		maven 'Jenkins_Maven'
		jdk 'Jenkins_JDK'
	}
	stages
	{
		stage('Build')
		{
			steps
			{
				sh 'mvn clean package'
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
