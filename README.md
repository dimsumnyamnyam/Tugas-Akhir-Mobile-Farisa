# Tugas Akhir Mobile - Aplikasi Pemesanan Dimsum & Risol

Aplikasi ini dibuat untuk memenuhi Tugas Akhir mata pelajaran Pemrograman Perangkat Bergerak (Mobile). Aplikasi ini berfungsi untuk memudahkan pelanggan memesan dimsum dan risol, serta dilengkapi dengan halaman admin web untuk merekap data pesanan.

## Data Diri Siswa
- Nama: Farisa Shefalyan
- Kelas: XII PPLG 2
- Asal Sekolah: SMK Negeri 1 Pedan
- Guru Pengampu: Bapak Bangun Nugroho

## Fitur Aplikasi
- Halaman menu untuk memilih pesanan dan menghitung total harga otomatis.
- Halaman riwayat pesanan untuk memantau status pesanan.
- Halaman ulasan untuk memberikan penilaian.
- Halaman klaim yang menggunakan sensor kamera HP untuk mengunggah foto bukti jika pesanan bermasalah.
- Halaman dashboard admin berbasis web (PHP/MySQL) yang dilengkapi fitur cetak laporan ke Excel.

## Urutan Penggunaan Aplikasi
1. Login ke dalam aplikasi.
2. Buka halaman menu, pilih jumlah pesanan yang diinginkan, lalu lakukan checkout.
3. Buka halaman riwayat pesanan untuk melihat status pesanan (menunggu konfirmasi, diproses, dll).
4. Jika pesanan sudah selesai, pengguna bisa memberikan penilaian di halaman ulasan.
5. Jika ada pesanan yang tidak sesuai, pengguna bisa membuka halaman klaim, mengambil foto bukti menggunakan kamera HP, dan mengirimkannya.

## Penjelasan Isi Folder
- folder `MIT`: Berisi file mentah project (.aia) dan file aplikasi siap install (.apk).
- folder `database`: Berisi file database (.sql) untuk di-import ke phpMyAdmin.
- folder `hasil laporan penjualan`: Contoh file Excel (.xls) hasil unduhan dari halaman admin.
- folder `screen`: Kumpulan screenshot tampilan desain aplikasi.
- folder `source kode`: Berisi file-file PHP untuk backend aplikasi dan halaman admin web.

## Cara Menjalankan Project
1. Buka aplikasi Laragon, lalu jalankan Apache dan MySQL.
2. Buka phpMyAdmin di browser, buat database baru dengan nama `db_food_order`, lalu import file .sql yang ada di folder database.
3. Pindahkan semua file yang ada di dalam folder `source kode` ke dalam folder htdocs/www (contoh: C:\laragon\www\food_order).
4. Install file .apk ke HP Android. Pastikan HP dan laptop terhubung ke jaringan WiFi yang sama.
5. Untuk membuka halaman admin, buka browser di laptop lalu akses `http://localhost/food_order/admin.php`.
