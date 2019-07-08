pipeline 
{
	agent any
	stages
	{
		stage('Build')
		{
			steps
			{
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
