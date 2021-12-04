# variables
LOCAL_APP_PATH=docker/local/rust/
APP_NAME=app
CARGO=cargo
PROJECT_NAME=rust-docker-actix-web-demo

@PHONY: init up down down-init bench build check clean doc install publish run test update postgres logs

# setup
init:
	USER=root $(CARGO) new --bin $(APP_NAME) &&\
	cd app &&\
	$(CARGO) build

up:
	cp $(LOCAL_APP_PATH)/Dockerfile . &&\
	docker-compose build --no-cache --progress plain &&\
	docker-compose up -d &&\
	rm Dockerfile

# teardown
down:
	docker-compose down

down-init:
	docker-compose down --rmi all -v

# cargo
bench:
	$(CARGO) bench

build:
	$(CARGO) build

check:
	$(CARGO) check

clean:
	$(CARGO) clean

doc:
	$(CARGO) doc

install: build
	$(CARGO) install

publish:
	$(CARGO) publish

run: build
	$(CARGO) run

test: build
	$(CARGO) test

update:
	$(CARGO) update

# exec
work:
	docker exec -it $(PROJECT_NAME)_app_1 /bin/bash

postgres:
	docker exec -it $(PROJECT_NAME)_db_1 /bin/bash

# application logs
logs:
	docker logs $(PROJECT_NAME)_app_1 -f
