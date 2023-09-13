ifndef VERSION
$(error VERSION is not set)
endif

NAME="TheReckoningProject/specprod-rds-reckoning"

all: build

build:
	docker build -t $(NAME):$(VERSION) .

push:
	docker push $(NAME):$(VERSION)