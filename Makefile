lint: 
	tidy -q -e ./blue/*.html
	tidy -q -e ./green/*.html
	dockerfile_lint -f Dockerfile.blue
	dockerfile_lint -f Dockerfile.green

build: 
	docker build -t sergiopichardo/nginx-blue -f Dockerfile.blue . 
	docker build -t sergiopichardo/nginx-green -f Dockerfile.green . 

run-blue: 
	docker run -p 80:80 sergiopichardo/nginx-blue 

run-green: 
	docker run -p 80:80 sergiopichardo/nginx-green 

upload: 
	docker push sergiopichardo/nginx-blue
	docker push sergiopichardo/nginx-green

clean: 
	echo y | docker system prune 