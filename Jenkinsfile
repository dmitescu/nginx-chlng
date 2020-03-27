pipeline {
    agent {
	dockerfile {
	    filename 'Dockerfile.build'
	    args '-v /var/run/docker.sock:/var/run/docker.sock'
	}
    }
    
    stages {
	stage('Build') {
	    steps {
		sh './configure'
		sh 'make'
		sh 'docker build . -t mitescugd/my-nginx:latest'
	    }
	}

	stage('Run') {
    	    steps {
		sh 'docker stop my-nginx || true'
		sh 'docker rm my-nginx || true'
		sh 'docker run -dit -p 8081:8081 --name my-nginx mitescugd/my-nginx:latest'
    	    }
    	}
    }

    post {
	success {
            # Works if Jenkins is running on the same host as Docker
	    # For the case Jenkins runs inside a Docker container
	    # --network should be used
	    sh "curl -o /tmp/${env.BUILD_DISPLAY_NAME}_`date --iso`_nginx.out 127.0.0.1:8081 || true"
	}
    }
}
