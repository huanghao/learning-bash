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
	less

RUN echo 'root:Docker!' | chpasswd
RUN useradd -ms /bin/bash alice
USER alice
WORKDIR /home/alice
