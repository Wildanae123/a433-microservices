# Perintah untuk menggunakan Node.js versi 14 sebagai base image
FROM node:14-alpine

# Perintah untuk menyetting  working directory ntuk container adalah /app
WORKDIR /app

# Perintah untuk menyalin semua berkas yang ada di local working directory saat ini ke container working directory (yakni, /app)
COPY . .

# Perintah agar aplikasi berjalan dalam production mode dan menggunakan container bernama item-db sebagai database host
ENV NODE_ENV=production DB_HOST=item-db

# Perintah untuk menginstal dependencies untuk production dan kemudian build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Perintah untuk expose port yang digunakan oleh aplikasi
EXPOSE 8080

# Perintah untuk menjalankan server dengan perintah npm start
CMD [ "npm", "start" ]

# Perintah untuk menghubungkan repositori ke container image
LABEL org.opencontainers.image.source=https://github.com/Wildanae123/a433-microservices