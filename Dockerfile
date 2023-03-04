FROM nginx:latest

ADD ./dist /www

RUN echo "\
    server { \
      listen 80; \
      server_name localhost; \
      client_header_buffer_size 16k; \
      client_max_body_size 1024M; \
      gzip on; \
      gzip_min_length 1k; \
      gzip_comp_level 9; \
      gzip_types text/plain application/javascript application/x-javascript text/css application/xml text/javascript application/x-httpd-php image/jpeg image/gif image/png; \
      gzip_vary on; \
      gzip_disable \"MSIE [1-6]\.\"; \
      location / { \
        root /www; \
        index index.html index.htm;  \
        client_max_body_size 1024M; \
      } \
    }" > /etc/nginx/conf.d/default.conf

    EXPOSE 80