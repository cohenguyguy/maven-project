pipeline 
{
	agent any
	stages
	{
		stage('Build')
		{
			steps
			{
				sh 'echo $PATH'
			}
			post
			{
				success 
				{
					echo 'Now Archiving...'
					//archiveArtifacts artifacts: '**/target/*.war'
				}
			}
		}
	}
}
