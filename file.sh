#!/bin/sh

echo "🚀 Memulai setup otomatis bot..."

sleep 1
echo "📦 Mengupdate package Termux..."
pkg update -y && pkg upgrade -y

echo "📦 Menginstal Node.js LTS..."
pkg install nodejs-lts -y

echo "📦 Menginstal FFmpeg..."
pkg install ffmpeg -y

echo "📦 Menginstal PM2 (Process Manager)..."
npm install -g pm2

echo "📦 Menginstal semua module dari package.json..."
npm install

echo "🧹 Menghapus @ffmpeg-installer/ffmpeg jika ada..."
npm uninstall @ffmpeg-installer/ffmpeg

echo "📦 Menginstal fluent-ffmpeg..."
npm install fluent-ffmpeg

echo "✅ Semua dependensi telah terinstall."

sleep 1

# Cek apakah file index.js ada
if [ -f "index.js" ]; then
  echo "🚀 Menjalankan bot dengan PM2..."
  pm2 start index.js

  echo "🟢 Menjalankan juga bot pakai npm start (jika tersedia)..."
  npm start || echo "⚠️  Gagal menjalankan 'npm start'. Mungkin belum didefinisikan di package.json."

  echo "✅ Bot berhasil dijalankan."
  echo "📜 Gunakan 'pm2 logs' atau 'npm start' jika ingin lihat ulang."
else
  echo "❌ Gagal: File 'index.js' tidak ditemukan di folder ini."
  echo "📁 Pastikan kamu berada di folder bot sebelum menjalankan script ini."
fi