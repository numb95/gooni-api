PWD ?= pwd_unknown


.PHONY: help build-dev build-prod lint test run doc
help:
	@echo ''
	@echo 'Usage: make [TARGET]'
	@echo 'Targets:'
	@echo '  build-dev              Build docker image for current development'
	@echo '  build-prod             Build docker image for prodution and push to registry'
	@echo '  clean-pyc              Delete all .pyc and .pyo files'
	@echo '  clean-all              Delete all .pyc, .pyo, .egg, .egg-info, __pycache__, dist/ and build/ '
	@echo '  lint                   Lint the code using flake8'
	@echo '  test                   Run test'
	@echo '  run                    Run the project on localserver'
	@echo '  doc                    Generate docs'

build-dev:
	docker build -t gooni-api -f Dockerfile .

build-prod:
	export IMAGE_TAG=`echo ${CI_PROJECT_NAME} | sed -e 's/\(.*\)/\L\1/'`
	docker build -t ${IMAGE_TAG}:${CI_COMMIT_TAG} -f Dockerfile .
	docker tag ${IMAGE_TAG}:${CI_COMMIT_TAG} ${IMAGE_TAG}:latest
	docker push ${IMAGE_TAG}:${CI_COMMIT_TAG}
	docker push ${IMAGE_TAG}:latest


lint:
	echo "NOT READY"

test:
	echo "NOT READY"

run:
	go run main.go

doc:
	echo "NOT READY"
