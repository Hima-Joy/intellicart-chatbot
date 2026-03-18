FROM nginx:alpine

# Copy files
COPY . /usr/share/nginx/html

# Remove default nginx config and use simple config
RUN rm /etc/nginx/conf.d/default.conf

# Create custom config for OpenShift
RUN echo 'server { \
    listen 8080; \
    location / { \
        root /usr/share/nginx/html; \
        index index.html; \
    } \
}' > /etc/nginx/conf.d/default.conf

# Fix permissions for OpenShift
RUN chmod -R 777 /usr/share/nginx/html \
    && chmod -R 777 /var/cache/nginx \
    && chmod -R 777 /var/run \
    && chmod -R 777 /etc/nginx

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
