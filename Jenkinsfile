pipeline 
{
	agent any

	parameters
	{
		string(name: "tomcat_dev", defaultValue: "18.233.168.83", description: "Staging Server")
		string(name: "tomcat_prod", defaultValue: "54.227.219.126", description: "Production Server")
		string(name: "toProd", defaultValue: "false", description: "deploy to Production Server")
	}

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

		stage('Deployments')
		{
            parallel
            {
    			stage('Deploy to Staging')
	    		{
		    		steps
			    	{
				    	sh "scp -i /home/ec2-user/ssh/Guy01Key.pem **/target/*.war ec2-user@${params.tomcat_dev}:/home/ec2-user/apache-tomcat-8.5.42/webapps"
				    }
			    }

    			stage('Deploy to Production')
	    		{
		    		steps
			    	{
				    	sh "scp -i /home/ec2-user/ssh/Guy01Key.pem **/target/*.war ec2-user@${params.tomcat_prod}:/root/apache-tomcat-8.5.42/webapps"
				    }
                    when {
                        expression { params.toProd == 'true' }
                    }
		    	}
            }
        }
    }
}
