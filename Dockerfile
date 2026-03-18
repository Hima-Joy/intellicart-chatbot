FROM nginx:alpine

# Remove default config (optional but safe)
RUN rm /etc/nginx/conf.d/default.conf

# Create writable directories
RUN mkdir -p /var/cache/nginx \
    && mkdir -p /var/run \
    && chmod -R 777 /var/cache/nginx \
    && chmod -R 777 /var/run \
    && chmod -R 777 /usr/share/nginx/html

# Copy your files
COPY . /usr/share/nginx/html

# Expose port
EXPOSE 8080

# Run nginx on non-root port
CMD ["nginx", "-g", "daemon off;"]
