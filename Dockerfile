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
	telnet \
	net-tools \
	tmux

RUN useradd -m -s /bin/bash -G sudo alice && useradd -m -s /bin/bash -G sudo bob
RUN echo 'alice ALL=NOPASSWD: ALL' >> /etc/sudoers
RUN printf 'alice:Docker!\nbob:Docker!' | chpasswd

RUN printf "alias ls='ls -F --color'\n\
alias c=clear" > /home/alice/.bash_aliases

RUN printf "unbind C-b\n\
set -g prefix \`\n\
bind-key \` send-prefix\n\
set -g status-bg black\n\
set -g status-fg white\n\
set -g status-right ''\n\
set-window-option -g window-status-current-bg red\n" >/home/alice/.tmux.conf

USER alice
WORKDIR /home/alice
