all: build run

build:
	docker build --rm -t bruce30262/afl-docker .

run:
	docker run -e TERM --privileged --security-opt seccomp:unconfined -v /home/bruce30262/Desktop:/mnt/files --name=afl-docker -it bruce30262/afl-docker /bin/bash -c 'echo core >/proc/sys/kernel/core_pattern;cd /mnt/files; exec "/usr/bin/zsh"'

exec:
	docker exec -it afl-docker /bin/bash -c 'cd /mnt/files; exec "/usr/bin/zsh"'
