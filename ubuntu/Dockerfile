FROM ubuntu:20.04

RUN apt update -y \
	&& apt install -y wget software-properties-common gpg-agent x11vnc xvfb 

RUN dpkg --add-architecture i386 \
	&& wget -qO - https://dl.winehq.org/wine-builds/winehq.key | apt-key add - \
	&& apt-add-repository -y 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' \
	&& apt install -y winehq-stable

RUN wget http://winetricks.org/winetricks \
	&& chmod +x winetricks \
	&& mv winetricks /usr/bin/winetricks \
	&& winetricks wenquanyi

RUN apt install -y locales \
	&& locale-gen ja_JP.UTF-8

ENV WINEDLLOVERRIDES "mscoree=d;mshtml=d"

COPY ./run.sh /run.sh
CMD /run.sh