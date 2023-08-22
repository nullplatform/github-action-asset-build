.PHONY: push-docker-image push-lambda

build-docker-image:
	docker build $(BUILD_ARGS) -t $(ASSET_NAME) -f $(ASSET_WORKING_DIRECTORY)/Dockerfile $(BUILD_WORKING_DIRECTORY)

build-lambda:
	echo "Default build not supported for 'lambda' asset type yet"
