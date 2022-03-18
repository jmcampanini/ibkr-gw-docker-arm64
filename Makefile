run: build
	docker run -it -p 5000:5000 ibkr-gateway:latest

clean:
	docker image rm ibkr-gateway:latest

build:
	docker build --tag ibkr-gateway:latest .

debug: build
	docker run -it -p 5000:5000 ibkr-gateway:latest bash
