.PHONY: install uninstall

all: install

create:
	docker-compose run --rm discuss-app mix phoenix.new discuss

install:
	docker-compose build --force-rm
	docker-compose run --rm discuss-app mix deps.get
	docker-compose run --rm discuss-app npm install
	docker-compose down

uninstall:
	docker-compose down --rmi all
