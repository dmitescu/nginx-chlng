FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y libpcre3
RUN apt-get install -y zlib1g

WORKDIR nginx-run/

COPY objs/nginx nginx
COPY nginx.conf nginx.conf

RUN mkdir -p /usr/local/nginx/logs

ENTRYPOINT ["nginx", "-c", "nginx.conf"]
