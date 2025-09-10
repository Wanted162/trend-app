# Use official Node.js image
FROM node:18

# Set working directory
WORKDIR /app

# Copy files from your project into container
COPY . .

# Install dependencies (if package.json exists)
RUN if [ -f package.json ]; then npm install; fi

# Expose port 3000
EXPOSE 3000

# Run the app using a simple HTTP server (since you have dist folder)
RUN npm install -g serve
CMD ["serve", "-s", "dist", "-l", "3000"]
