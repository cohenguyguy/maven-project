pipeline 
{
	agent any
	stages
	{
		stage('Build')
		{
			steps
			{
				sh 'export MAVEN_HOME=/home/ec2-user/apache-maven-3.6.1'
				sh 'export PATH=$PATH:$MAVEN_HOME/bin'
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
