# Use an official Node.js LTS (Long Term Support) image as the base
FROM node:lts-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm ci --production

# Copy the entire project directory into the container
COPY . .

# Expose the desired port (default is 3001 for NestJS)
EXPOSE 3001

# Start the NestJS application
CMD ["npm", "run", "start:prod"]
