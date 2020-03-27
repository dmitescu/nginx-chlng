FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y libpcre3
RUN apt-get install -y zlib1g

WORKDIR nginx-run/

RUN mkdir -p /usr/local/nginx/logs
RUN mkdir -p /usr/local/nginx/conf
RUN mkdir -p /usr/website

COPY objs/nginx nginx
COPY conf/* /usr/local/nginx/conf/
COPY nginx.conf /usr/local/nginx/conf/nginx.conf

EXPOSE 8081

ENTRYPOINT ["./nginx"]
