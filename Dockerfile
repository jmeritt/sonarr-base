FROM jmeritt/htpcarr

USER htpc

RUN cd ~ && wget "https://services.sonarr.tv/v1/download/main/latest?version=4&os=linux" -O Sonarr.tar.gz &&\
    tar -xvzf Sonarr.tar.gz &&\
    rm Sonarr.tar.gz

EXPOSE 8989

ENV PROGRAMDATA /config

CMD ~/Sonarr/Sonarr -nobrowser -data=$PROGRAMDATA