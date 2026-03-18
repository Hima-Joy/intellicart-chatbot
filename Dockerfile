FROM nginx:alpine

COPY . /usr/share/nginx/html

# Fix permissions
RUN chmod -R 777 /usr/share/nginx/html \
    && chmod -R 777 /var/cache/nginx \
    && chmod -R 777 /var/run

# Change port to 8080
RUN sed -i 's/listen       80;/listen       8080;/g' /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
