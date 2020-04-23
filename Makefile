lint: 
	tidy -q -e ./blue/*.html
	tidy -q -e ./green/*.html
	dockerfile_lint -f ./blue/Dockerfile
	dockerfile_lint -f ./green/Dockerfile