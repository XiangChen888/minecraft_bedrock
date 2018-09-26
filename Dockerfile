FROM ubuntu:18.04

EXPOSE 19132/udp 19132
ENV BEDROCK_SERVER_VERSION 1.6.1.0

RUN  apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y curl \
  && apt-get install -y wget \
  && apt-get install unzip \
  && apt-get install -y git \
  && apt-get install -y libcurl4-openssl-dev

RUN cd /home && mkdir bedrock_server && wget https://minecraft.azureedge.net/bin-linux/bedrock-server-${BEDROCK_SERVER_VERSION}.zip \
  && unzip bedrock-server-1.6.1.0.zip -d /home/bedrock_server && chmod u+x ./bedrock_server
WORKDIR /home/bedrock_server
ENV LD_LIBRARY_PATH /home/bedrock_server

CMD ["./bedrock_server"]
#CMD ["/bin/bash"]