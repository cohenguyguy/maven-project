pipeline 
{
	agent any
	stages
	{
		stage('Build')
		{
			steps
			{
				sh 'export PATH=$PATH:home/ec2-user/apache-maven-3.6.1/bin'
				sh 'mvn -v'
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
