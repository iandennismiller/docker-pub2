# Manage docker-pub2/application

build:
	docker build -t application .

deploy:
	docker login
	docker tag application iandennismiller/application
	docker push iandennismiller/application

.PHONY: build deploy
