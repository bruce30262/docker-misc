IMG="bruce30262-blog-jekyll-img"
CTN="bruce30262-blog-jekyll"

all: build run

build:
	docker build --rm -t bruce30262/$(IMG) .
run:
	docker run -e TERM --privileged --security-opt seccomp:unconfined -p 4000:4000 -v ~/bruce30262.github.io:/app --name=$(CTN) -it bruce30262/$(IMG) /bin/bash -c 'cd /app && bundle exec jekyll serve --host 0.0.0.0'
sh:
	docker run -e TERM --privileged --security-opt seccomp:unconfined -p 4000:4000 -v ~/bruce30262.github.io:/app --name=$(CTN) -it bruce30262/$(IMG) /bin/bash -c 'cd /app && /bin/bash'
exec:
	docker exec -it $(CTN) /bin/bash -c 'cd /app && /bin/bash'
