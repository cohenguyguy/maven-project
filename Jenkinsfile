pipeline 
{
	agent any

	parameters
	{
		string(name: "tomcat_dev", defaultValue: "18.205.107.68", description: "Staging Server")
		string(name: "tomcat_prod", defaultValue: "3.95.190.36", description: "Production Server")
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
                        echo "Deploy to Staging"
				    	sh "scp -i /home/ec2-user/ssh/Guy01Key.pem **/target/*.war ec2-user@${params.tomcat_dev}:/home/ec2-user/apache-tomcat-8.5.42/webapps"
				    }
			    }

    			stage('Deploy to Production')
	    		{
		    		steps
			    	{
                        echo "Deploy to Production"
				    	sh "scp -i /home/ec2-user/ssh/Guy01Key.pem **/target/*.war ec2-user@${params.tomcat_prod}:/home/ec2-user/apache-tomcat-8.5.42/webapps"
				    }
		    	}
            }
        }
    }
}
