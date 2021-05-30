FROM registry.gitlab.com/dedyms/alpine:edge
WORKDIR /mpd
RUN apk add --no-cache mpd mpc && setcap -r /usr/bin/mpd
COPY mpd.conf /mpd/mpd.conf
RUN chown -R $CONTAINERUSER:$CONTAINERUSER /mpd/

USER $CONTAINERUSER
EXPOSE 6600
EXPOSE 8800
CMD ["mpd", "--stdout", "--no-daemon", "/mpd/mpd.conf"]
