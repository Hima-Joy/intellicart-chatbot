FROM nginx:alpine

COPY . /usr/share/nginx/html

# Fix permissions for OpenShift
RUN chmod -R 777 /usr/share/nginx/html \
    && chmod -R 777 /var/cache/nginx \
    && chmod -R 777 /var/run \
    && chmod -R 777 /etc/nginx

# Change Nginx to run on port 8080
RUN sed -i 's/listen       80;/listen       8080;/g' /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
