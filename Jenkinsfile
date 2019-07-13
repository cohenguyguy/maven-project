pipeline 
{
	agent any

//	parameters
//	{
//		string(name: "tomcat_dev", defaultValue: "18.233.168.83", description: "Staging Server")
//		string(name: "tomcat_prod", defaultValue: "54.227.219.126", description: "Production Server")
//	}

	tools
	{
		maven 'Jenkins_Maven'
		jdk 'Jenkins_JDK'
	}

	triggers
	{
		pollSCM("* * * * *")
	}

	stages
	{
		stage('Build')
		{
			steps
			{
				sh "mvn clean package"
                sh "docker build . -t tomcatwa:${env.BUILD_ID}"
			}
		}
    }
}
