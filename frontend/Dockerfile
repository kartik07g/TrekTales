# Use official Node.js image
FROM node:20-alpine AS frontend

# Set working directory
WORKDIR /app

# Install required dependencies for build tools
RUN apk add --no-cache python3 make g++

# Copy package files first to leverage Docker cache
COPY package*.json ./

# Install dependencies with legacy-peer-deps to avoid conflicts
RUN npm install --legacy-peer-deps

# Copy the rest of the application code
COPY . .

# Build the app
RUN npm run build

# Use a lightweight server for serving the built files
FROM nginx:alpine AS production

# Copy built frontend to Nginx
COPY --from=frontend /app/dist /usr/share/nginx/html

# Expose port
EXPOSE 3000

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
