#
# Makefile for processing assets
#
# This Makefile is designed to receive parameters that control its behavior.
# It helps manage assets by processing them in a specified working directory
# and outputting the results to a designated asset output directory.

# Parameter: ASSET_WORKING_DIRECTORY
# This is the directory where the assets will be processed from.
# This variable is set to the path of the directory containing your source assets.

# Parameter: ASSET_OUTPUT_DIRECTORY
# This is the directory where the processed assets will be stored.
# This variable is set to the path of the directory where the processed assets will be saved.

# Parameter: ASSET_TARGET_URL
# The remote repository URL where the processed assets will be pushed or deployed.
# This variable is set to the URL of the destination repository.

# Parameter: ASSET_NAME
# The name of the asset being processed. It is used to create the ASSET_FILE.

.PHONY: build push

build:
	docker buildx build --build-arg VERSION=$(VERSION) --build-arg ARCH=$(ARCH) --platform $(PLATFORM) --load -t $(ASSET_NAME) -f $(ASSET_WORKING_DIRECTORY)/Dockerfile $(BUILD_WORKING_DIRECTORY)
push:
	docker tag $(ASSET_NAME):latest $(ASSET_TARGET_URL)
	docker push $(ASSET_TARGET_URL)