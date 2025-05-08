# Use official Node.js base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install --legacy-peer-deps

# Copy all source code
COPY . .

# Build the project (compiles TS to JS)
RUN npm run build

# Expose backend port
EXPOSE 5000

# Start the server
CMD ["npm", "start"]
