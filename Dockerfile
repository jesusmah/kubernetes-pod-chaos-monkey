FROM debian:jessie

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
  curl

RUN cd /usr/local/bin && curl -O https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod 755 kubectl

WORKDIR /usr/src/app
COPY chaos.sh ./
CMD ["bash", "/usr/src/app/chaos.sh"]
