# Stage 1: Build the Next.js application
FROM node:21-alpine AS build

WORKDIR /app

COPY api-gateway/ .

RUN npm install

RUN npm run test

RUN npm run build

EXPOSE 3000

# Start the Next.js application
CMD ["npm", "start"]
