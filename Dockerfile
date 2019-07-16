FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && \
	apt-get install -y --no-install-recommends curl wget apt-transport-https software-properties-common gpg-agent

RUN dpkg --add-architecture i386 && \
	wget -qO - https://dl.winehq.org/wine-builds/winehq.key | apt-key add - && \
	apt-add-repository -y 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' && \
	apt-get install -y winehq-stable

RUN apt-get install curl \
	&& curl -SL 'https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks' -o /usr/local/bin/winetricks && \
	chmod +x /usr/local/bin/winetricks

RUN apt-get install -y --no-install-recommends xvfb x11vnc xdotool

ENV LANG="ja_JP.UTF-8" \
	WINEARCH=win32 \
	WINEDLLOVERRIDES="mscoree=d;mshtml=d" \
	W_OPT_UNATTENDED=1

RUN winetricks wenquanyi

COPY ./run.sh /run.sh
RUN chmod a+rx /run.sh
CMD /run.sh