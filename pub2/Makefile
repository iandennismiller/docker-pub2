# Manage docker-pub2

build:
	docker build -t pub2 .

deploy:
	docker login
	docker tag pub2 iandennismiller/pub2
	docker push iandennismiller/pub2

.PHONY: build deploy
