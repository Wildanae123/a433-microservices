# Perintah untuk menggunakan Node.js versi 14 sebagai base image
FROM node:14.21-alpine

# Perintah untuk menyetting  working directory ntuk container adalah /app
WORKDIR /app

# Perintah untuk menyalin semua berkas yang ada di local working directory saat ini ke container working directory (yakni, /app)
COPY . .

# Perintah untuk menginstal dependencies
RUN npm install

# Perintah untuk expose port yang digunakan oleh aplikasi
EXPOSE 3001

# Perintah untuk menjalankan server dengan perintah npm start
CMD ["npm", "start"]

# Perintah untuk menghubungkan repositori ke container image
LABEL org.opencontainers.image.source=https://github.com/Wildanae123/a433-microservices