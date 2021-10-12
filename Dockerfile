FROM jmeritt/debian-htpc

RUN apt-get update &&\
    apt-get install -y gnupg &&\
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF &&\
    echo "deb https://download.mono-project.com/repo/debian stable-buster main" | tee /etc/apt/sources.list.d/mono-official-stable.list &&\
    wget https://mediaarea.net/repo/deb/repo-mediaarea_1.0-16_all.deb &&\
    dpkg -i repo-mediaarea_1.0-16_all.deb &&\
    apt-get update &&\
    apt-get install -y mono-devel libmediainfo-dev

USER htpc

RUN cd ~ && wget "https://services.sonarr.tv/v1/download/main/latest?version=3&os=linux" -O Sonarr.tar.gz &&\
    tar -xvzf Sonarr.tar.gz &&\
    rm Sonarr.tar.gz

EXPOSE 8989

ENV PROGRAMDATA /config

CMD mono --debug ~/Sonarr/Sonarr.exe /nobrowser /data=$PROGRAMDATA