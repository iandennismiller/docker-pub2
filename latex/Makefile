# Manage docker-pub2/latex

build:
	docker build -t latex .

deploy:
	docker login
	docker tag latex iandennismiller/latex
	docker push iandennismiller/latex

.PHONY: build deploy
