FROM ubuntu:15.10

RUN apt-get update -y

# Install FFMPEG
ENV FFMPEG_VERSION=2.7.1 \
    X264_VERSION=snapshot-20150627-2245-stable

COPY install.sh /var/cache/ffmpeg/install.sh
RUN bash /var/cache/ffmpeg/install.sh

RUN apt-get update
RUN apt-get install -y supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
