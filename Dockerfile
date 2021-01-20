FROM alpine:3.13
WORKDIR /mpd
RUN apk add --no-cache mpd mpc && setcap -r /usr/bin/mpd
COPY mpd.conf /mpd/mpd.conf
RUN adduser --disabled-password --uid 1000 abc
RUN chown -R abc:abc /mpd/


USER abc
EXPOSE 6600
EXPOSE 8800
CMD ["mpd", "--stdout", "--no-daemon", "/mpd/mpd.conf"]
