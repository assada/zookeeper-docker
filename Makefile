build:
	docker build -t assada/zookeeper:latest .

up:
	docker run --name zoo1 -d --network assada -v $(pwd)/conf:/conf assada/zookeeper:latest
	docker run --name zoo2 -d --network assada -v $(pwd)/conf:/conf assada/zookeeper:latest
	docker run --name zoo3 -d --network assada -v $(pwd)/conf:/conf assada/zookeeper:latest

stop:
	docker stop zoo3
	docker stop zoo2
	docker stop zoo1
	docker container rm zoo1 zoo2 zoo3

network:
	docker network create assada
