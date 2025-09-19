# Use lightweight Nginx to serve static files
FROM nginx:alpine

# Set working directory to nginx html folder
WORKDIR /usr/share/nginx/html

# Copy built React files into container
COPY dist/ .

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
