# Use a lightweight Nginx base image
FROM nginx:alpine

# Copy your HTML/CSS content into the default Nginx web root
COPY . /usr/share/nginx/html

# Expose the default Nginx port
EXPOSE 80

# The default Nginx command starts the server
CMD ["nginx", "-g", "daemon off;"]
