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
	    sh "curl -o /tmp/${env.BUILD_DISPLAY_NAME}_`date --iso`_nginx.out my-nginx:8081 || true"
	}
    }
}
