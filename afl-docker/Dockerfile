# based on https://github.com/ThalesIgnite/afl-training
FROM ubuntu:16.04
MAINTAINER bruce30262

# update apt-get
#RUN sed -i "s/archive.ubuntu.com/tw.archive.ubuntu.com/g" /etc/apt/sources.list
RUN apt-get update && apt-get install -y locales

# Set the locale
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# AFL + Deps
##############
RUN apt-get install -y clang llvm-dev git build-essential curl vim libssl-dev tmux cgroup-bin sudo ruby net-tools zsh wget
RUN update-alternatives --install /usr/bin/clang clang `which clang-3.8` 1
RUN update-alternatives --install /usr/bin/clang++ clang++ `which clang++-3.8` 1
RUN update-alternatives --install /usr/bin/llvm-config llvm-config `which llvm-config-3.8` 1
RUN update-alternatives --install /usr/bin/llvm-symbolizer llvm-symbolizer `which llvm-symbolizer-3.8` 1

# dotfiles
RUN git clone https://github.com/bruce30262/dotfiles.git ~/dotfiles &&\
    cd ~/dotfiles &&\
    bash set_vim.sh &&\
    ruby install.rb --tmux --zsh

# install AFL via ctf-tools
RUN apt-get install -y libglib2.0-dev
RUN cd ~/dotfiles/ctf-tool &&\
    ruby install_ctf_tool.rb --afl

# crashwalk + exploitable
RUN apt-get install -y gdb golang
RUN cd ~ && mkdir src
RUN cd ~/src && git clone https://github.com/jfoote/exploitable.git
RUN cd ~ && mkdir go
ENV GOPATH=/root/go
RUN go get -u github.com/bnagy/crashwalk/cmd/...

# copy testing directory
RUN mkdir -p /root/afl-test && chown root:root /root/afl-test
COPY afl-test/ /root/afl-test/


