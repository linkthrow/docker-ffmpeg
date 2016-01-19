FROM ubuntu:15.10

RUN apt-get update -y

# Install FFMPEG
ENV FFMPEG_VERSION=2.7.1 \
    X264_VERSION=snapshot-20150627-2245-stable

RUN apt-get update \
 && apt-get install -y bzip2 libgnutls-deb0-28 libogg0 libjpeg8 libpng12-0 \
      libvpx2 libtheora0 libxvidcore4 libmpeg2-4 \
      libvorbis0a libfaad2 libmp3lame0 libmpg123-0 libmad0 libopus0

COPY install.sh /var/cache/ffmpeg/install.sh
RUN bash /var/cache/ffmpeg/install.sh

RUN apt-get update
RUN apt-get install -y supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN apt-get install libvo-aacenc-dev -y

CMD ["/usr/bin/supervisord"]
