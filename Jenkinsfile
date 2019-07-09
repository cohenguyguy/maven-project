pipeline 
{
	agent any
	stages
	{
		withEnv(['PATH+MVN=/home/ec2-user/apache-maven-3.6.1/bin:/usr/java/jdk1.8.0_211-amd64/bin'])
		{
			stage('Build')
			{
				steps
				{
					sh 'echo $PATH'
					sh 'mvn clean package'
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
