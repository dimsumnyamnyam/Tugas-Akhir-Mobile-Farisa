<?php
// Koneksi ke database
$host = "localhost";
$user = "root";       // Username default
$pass = "";           // Password default (kosong)
$db = "db_food_order"; // Nama database kamu

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Mengambil data dari tabel tb_produk
$sql = "SELECT nama_produk, harga FROM tb_produk"; 
$result = $conn->query($sql);

$produk = array();

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        // Menggabungkan nama dan harga agar tampil rapi
        $item = $row['nama_produk'] . " - Rp " . number_format($row['harga'], 0, ',', '.');
        
        // Memasukkan gabungan teks tersebut ke dalam array produk
        $produk[] = $item;
    }
}

// Mengubah array menjadi format JSON agar bisa dibaca Kodular
echo json_encode($produk);

$conn->close();
?>