<?php
$koneksi = mysqli_connect("localhost", "root", "", "db_food_order");

if (!$koneksi) {
    die("Koneksi gagal");
}

// Mengambil kolom yang BENAR-BENAR ADA di tabel tb_pesanan
$query = "SELECT id_pesanan, status_pesanan, total_harga FROM tb_pesanan ORDER BY id_pesanan DESC";
$result = mysqli_query($koneksi, $query);

$pesanan = array();
while ($row = mysqli_fetch_assoc($result)) {
    // Merapikan format angka (membuang .00 dan menambah titik ribuan)
    $harga_format = number_format($row['total_harga'], 0, ',', '.');
    
    // Menggabungkan data menjadi satu kalimat
    $baris = "Pesanan #" . $row['id_pesanan'] . " - Status: " . $row['status_pesanan'] . " (Rp" . $harga_format . ")";
    $pesanan[] = $baris;
}

// Menggabungkan semua baris dengan koma agar otomatis menjadi List di App Inventor
echo implode(",", $pesanan);
?>