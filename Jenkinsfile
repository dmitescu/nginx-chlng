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
		sh 'for cnt in $(docker ps -a | awk \'{print $1, $2}\' | grep mitescugd/my-nginx | awk \'{print $1}\'); do docker stop $cnt && docker rm $cnt; done'
		sh 'docker run -dit -p 8081:8081 --name my-nginx mitescugd/my-nginx:latest'
    	    }
    	}
    }
}
