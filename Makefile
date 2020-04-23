lint: 
	tidy -q -e ./blue/*.html
	dockerfile_lint -f ./blue/Dockerfile