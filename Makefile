.PHONY: push-docker-image push-lambda

build-docker-image:
	docker build -t $(ASSET_NAME) -f $(ASSET_WORKING_DIRECTORY)/Dockerfile .

build-lambda:
	echo "Default build not supported for 'lambda' asset type yet"