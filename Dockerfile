FROM alpine

RUN apk update \
	&& apk add wget libxext xvfb dbus wine x11vnc \
	&& dbus-uuidgen

RUN wget http://winetricks.org/winetricks && chmod +x winetricks && mv winetricks /usr/bin/winetricks

ENV WINEDLLOVERRIDES "mscoree=d;mshtml=d"

COPY ./run.sh /run.sh
CMD /run.sh