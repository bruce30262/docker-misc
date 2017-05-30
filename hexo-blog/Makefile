all: build run

build:
	docker build --rm -t bruce30262/hexo-blog .

run:
	docker run -it --rm -p 4000:4000 -v /home/bruce30262/bruce30262_blog:/app --name hexo-blog bruce30262/docker-misc:hexo-blog

exec:
	docker exec -it hexo-blog /bin/bash

deploy:
	docker exec -it hexo-blog /bin/bash -c "/app/script/deploy.sh"
