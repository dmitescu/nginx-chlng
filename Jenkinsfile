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
    }
    // 	stage('Run') {
    // 	    steps {
    // 	    }
    // 	}
    // }

}
