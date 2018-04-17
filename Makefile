VERSION=3.2.4-1

build:
	docker build . -t jouve/postfix:$(VERSION)

run:
	docker run jouve/postfix:$(VERSION)

sh:
	docker run -it jouve/postfix:$(VERSION) sh
