pipeline 
{
	agent any
	stages
	{
		stage('Build')
		{
			steps
			{
				sh '/home/ec2-user/apache-maven-3.6.1/bin/mvn -v'
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
	}
}
