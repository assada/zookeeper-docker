build:
	docker build -t assada/zookeeper:latest .

up:
	echo ${PWD}
	docker run -p 2181:2181 -e ZOO_MY_ID='1' --name zoo1 -d --network assada -v ${PWD}/conf:/conf assada/zookeeper:latest \
	&& sleep 2 && docker run -p 2182:2181 -e ZOO_MY_ID='2' --name zoo2 -d --network assada -v ${PWD}/conf:/conf assada/zookeeper:latest \
	&& sleep 2 && docker run -p 2183:2181 -e ZOO_MY_ID='3' --name zoo3 -d --network assada -v ${PWD}/conf:/conf assada/zookeeper:latest

stop:
	docker stop zoo3
	docker stop zoo2
	docker stop zoo1
	docker container rm zoo1 zoo2 zoo3

network:
	docker network create assada
