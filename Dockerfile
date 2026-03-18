FROM nginx:alpine

COPY . /usr/share/nginx/html

# Fix OpenShift permission issues
RUN chmod -R 777 /usr/share/nginx/html \
    && chmod -R 777 /var/cache/nginx \
    && chmod -R 777 /var/run \
    && chmod -R 777 /etc/nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
