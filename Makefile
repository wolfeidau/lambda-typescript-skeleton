#
# These can be overriden by the CI server using enviroment variables.
#
DEPLOY_ENV ?= 1
S3_BUCKET ?= ""
NODE_ENV ?= "production"

clean:
	rm -f handler.zip
	rm -f deploy.out.yaml
	rm -rf node_modules

test:
	yarn lint
	yarn test

# build and package with just the required deps, then put it back to dev
build: clean	
	yarn install --production
	zip -r handler.zip index.js node_modules
	yarn install

deploy: build
	aws cloudformation package \
		--template-file deploy.sam.yaml \
		--output-template-file deploy.out.yaml \
		--s3-bucket ${S3_BUCKET}

	aws cloudformation deploy \
		--template-file deploy.out.yaml \
		--capabilities CAPABILITY_IAM \
		--stack-name skeleton-lambda-${DEPLOY_ENV} \
		--parameter-overrides NodeEnv=${NODE_ENV}

.PHONY: test clean build deploy