FROM ubuntu

RUN printf 'deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse\n\
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse\n\
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse\n\
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse\n'\
> /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
	aptitude \
	man-db \
	vim \
	emacs-nox \
	wget \
	curl \
	less \
	sudo \
	tree \
	netcat \
	python3-minimal \
	bzip2 \
	htop \
	telnet

RUN useradd -m -s /bin/bash -G sudo alice && useradd -m -s /bin/bash -G sudo bob
RUN echo 'alice ALL=NOPASSWD: ALL' >> /etc/sudoers
RUN printf 'alice:Docker!\nbob:Docker!' | chpasswd

RUN printf "alias ls='ls -F --color'" > /home/alice/.bash_aliases

USER alice
WORKDIR /home/alice
