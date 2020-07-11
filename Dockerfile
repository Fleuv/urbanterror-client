FROM alpine:3

ENV URT_URL=http://cdn.urbanterror.info/urt/43/releases/zips/UrbanTerror434_full.zip

RUN wget \ 
        -O /tmp/UrbanTerror.zip \
        "$URT_URL" \
    && \
    mkdir -p \
        /usr/local/games/UrbanTerror \
    && \
    unzip \
        /tmp/UrbanTerror.zip \
        -d /tmp \
    && \
    cp -rf \
        /tmp/UrbanTerror*/* \
        /usr/local/games/UrbanTerror \
    && \ 
    rm -rf \
        /tmp/UrbanTerror* \
    && \
    chmod +x \
        /usr/local/games/UrbanTerror/Quake3-UrT.* \
    && \
    echo \
        "exec my.cfg" \
        > /usr/local/games/UrbanTerror/q3ut4/autoexec.cfg

COPY ./launcher /usr/local/bin

RUN chmod +x /usr/local/bin/launcher

ENV PATH=/usr/local/bin:/usr/local/games/UrbanTerror:$PATH

EXPOSE 27960

WORKDIR /usr/local/games/UrbanTerror

CMD [ "/usr/local/bin/launcher" ]