FROM nginx:latest

ADD ./dist /www
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80