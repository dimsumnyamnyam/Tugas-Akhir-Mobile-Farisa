<?php
// Sesuaikan "nama_database_mu" dengan nama database aslimu
$koneksi = mysqli_connect("localhost", "root", "", "db_food_order");

if (!$koneksi) {
    die("Koneksi gagal");
}

// Menangkap data 'nama' dan 'alasan' dari MIT App Inventor
$nama = $_POST['nama'];
$alasan = $_POST['alasan'];

// Memasukkan data komplain ke tabel tb_klaim
$query = "INSERT INTO tb_klaim (nama_pemesan, alasan) VALUES ('$nama', '$alasan')";

if(mysqli_query($koneksi, $query)) {
    echo "Komplain berhasil dicatat";
} else {
    echo "Gagal: " . mysqli_error($koneksi);
}
?>