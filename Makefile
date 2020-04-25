lint: 
	tidy -q -e *.html
	dockerfile_lint -f Dockerfile

build: 
	docker build -t sergiopichardo/nginx-blue . 
	
upload: 
	docker push sergiopichardo/nginx-blue

# login: 
# 	echo ${DOCKERHUB_PASSWORD} >> dockerhub_password_file
# 	cat dockerhub_password_file | docker login -u ${DOCKERHUB_USERNAME} --password-stdin
# 	rm -rf dockerhub_password_file