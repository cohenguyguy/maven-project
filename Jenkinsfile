pipeline 
{
	agent any
	stages
	{
		stage('Build')
		{
			steps
			{
				withEnv(['PATH+MVN=/home/ec2-user/apache-maven-3.6.1/bin'])                    
		                {
					sh 'echo $MVN'
					sh 'echo $PATH'
					//sh 'mvn clean package'
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
}
