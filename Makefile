run: build
	docker run -it -p 5000:5000 ibkr-gateway

clean:
	docker image rm ibkr-gateway

build:
	docker build --tag ibkr-gateway .
