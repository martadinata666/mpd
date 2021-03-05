FROM registry.gitlab.com/dedyms/sid-slim:latest
WORKDIR /mpd
RUN apt update && apt install -y --no-install-recommends libcap2-bin mpd mpc && setcap -r /usr/bin/mpd
COPY mpd.conf /mpd/mpd.conf
RUN chown -R $CONTAINERUSER:$CONTAINERUSER /mpd/

USER $CONTAINERUSER
EXPOSE 6600
EXPOSE 8800
CMD ["mpd", "--stdout", "--no-daemon", "/mpd/mpd.conf"]
