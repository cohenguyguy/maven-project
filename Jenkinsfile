pipeline 
{
	agent any
	stages
	{
		withEnv(['PATH=$PATH:/home/ec2-user/apache-maven-3.6.1/bin']) 
		{
			stage('Build')
			{
				steps
				{
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
