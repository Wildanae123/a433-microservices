FROM node:14.21-alpine as builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
EXPOSE 8000
CMD [ "npm", "run", "serve" ]

# Perintah untuk menghubungkan repositori ke container image
LABEL org.opencontainers.image.source=https://github.com/Wildanae123/a433-microservices