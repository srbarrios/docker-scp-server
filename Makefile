IMAGE = srbarrios/scp-server

build:
		docker build -t ${IMAGE} .

push: build
		docker push ${IMAGE}
