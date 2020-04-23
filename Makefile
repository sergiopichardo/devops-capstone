lint: 
	tidy -q -e *.html
	dockerfile_lint -f Dockerfile

build: 
	docker build -t sergiopichardo/nginx-blue . 
	
upload: 
	docker push sergiopichardo/nginx-blue