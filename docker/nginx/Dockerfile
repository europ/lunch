FROM nginx:1-alpine

RUN ln -fs /usr/share/zoneinfo/Europe/Prague /etc/localtime
RUN rm /etc/nginx/conf.d/default.conf

COPY ./proxy/certs/* /etc/nginx/certs/
COPY ./proxy/conf.d/* /etc/nginx/conf.d/

RUN nginx -t
