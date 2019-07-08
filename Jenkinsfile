pipeline 
{
	agent any
	stages
	{
		stage('Build')
		{
			steps
			{
				echo "Run maven"
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
	}
}
