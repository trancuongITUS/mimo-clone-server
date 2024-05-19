# Stage 1: Build the Next.js application
FROM node:21-alpine AS build

WORKDIR /app

COPY demo-microservices .

RUN npm install

RUN npm run build

# Stage 2: Create a lightweight image to serve the built application
FROM node:21-alpine

WORKDIR /app

# Expose the port Next.js runs on (default is 3000)
EXPOSE 3000

# Start the Next.js application
CMD ["npm", "start"]
