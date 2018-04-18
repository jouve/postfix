VERSION=3.2.4-2

build:
	docker build . -t jouve/postfix:$(VERSION)

run:
	docker run jouve/postfix:$(VERSION)

sh:
	docker run -it jouve/postfix:$(VERSION) sh
