FROM jmeritt/debian-htpc

RUN apt-get update -y && \
	apt-get install -y gnupg && \
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0xA236C58F409091A18ACA53CBEBFF6B99D9B78493 &&\
	echo "deb http://apt.sonarr.tv/ master main" | tee /etc/apt/sources.list.d/sonarr.list &&\
	apt-get update -y && \
	apt-get install -y nzbdrone

USER htpc

EXPOSE 8989

ENV PROGRAMDATA /config

CMD mono --debug /opt/NzbDrone/NzbDrone.exe /nobrowser /data=$PROGRAMDATA