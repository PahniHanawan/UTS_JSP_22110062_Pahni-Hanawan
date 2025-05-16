# UTS_JSP_22110062_Pahni-Hanawan
UTS Membuat Sistem Tiket Bioskop

Aplikasi Pemesanan Tiket Bioskop Berbasis JSP (Java Server Pages) Tanpa Database

Aplikasi ini merupakan aplikasi pemesanan tiket bioskop berbasis web menggunakan teknologi Java JSP dan Servlet tanpa menggunakan database. Aplikasi menampilkan daftar film, detail informasi film, jam tayang, dan memungkinkan pengguna untuk memesan tiket secara langsung. Data film disimpan secara sementara di dalam session selama aplikasi berjalan.

Fitur Aplikasi:
Menampilkan daftar film dengan poster, genre, durasi, harga, dan jam tayang.
Formulir pemesanan tiket (formPesan.jsp).
Proses konfirmasi pemesanan dan menampilkan ringkasan pesanan.

Struktur Folder
BioskopJSP/
│
├── Web Pages/
│   ├── index.jsp               // Halaman daftar film
│   ├── formPesan.jsp           // Form input pemesanan tiket
│   ├── konfirmasi.jsp          // Halaman konfirmasi pemesanan
│   └── img/                    // Folder gambar poster film
│       ├── the-matrix.jpg
│       ├── frozen.jpg
│       └── avengers.jpg
│
├── WEB-INF/
│   └── web.xml                 // Konfigurasi servlet (opsional)
│
├── Source Packages/
│   └── model/
│       └── Film.java           // Kelas Java untuk data Film
│
└── build.xml / nbproject/      // File konfigurasi NetBeans

Cara Menjalankan Aplikasi
Persyaratan:
IDE: NetBeans (direkomendasikan versi 12 ke atas)
Server: Apache Tomcat (biasanya sudah terpasang di NetBeans)
Java SDK (minimal Java 8)
Tidak memerlukan database

Langkah-langkah Menjalankan:
Buka NetBeans
Jalankan NetBeans IDE.
Buat Project Web
Pilih File > New Project
Pilih kategori: Java Web > Web Application
Klik Next, beri nama project, misalnya BioskopJSP
Klik Next, pilih server: Apache Tomcat
Klik Finish
Buat Struktur Folder dan File
Tambahkan folder img di dalam Web Pages/
Tambahkan file JSP: index.jsp, formPesan.jsp, konfirmasi.jsp
Tambahkan package model dan class Film.java
Masukkan Gambar Film
Salin file gambar seperti the-matrix.jpg, frozen.jpg, dan avengers.jpg ke dalam folder img/
Tulis Kode Program
Masukkan kode lengkap dari Film.java, index.jsp, dan file JSP lainnya.
Jalankan Project
Klik kanan pada project > Run
Browser akan terbuka dan menampilkan index.jsp (daftar film)
![gambar 1](https://github.com/user-attachments/assets/4336a749-cced-4001-9ad2-8bc5e244b622)

Form Pemesanan
