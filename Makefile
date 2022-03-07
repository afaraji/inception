create images from docker file in every dir
eg:
	services:
		nginx:
			build: ./src/.../nginx (will build image using docker file)
			ports:
				- "8080:80"
			volumes:
				- /some/path/..
		mariadb:
			build: .
