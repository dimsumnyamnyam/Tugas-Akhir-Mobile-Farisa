<?php
$host = "localhost";
$user = "root";
$pass = "";
$db = "db_food_order";

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die("Koneksi gagal");
}

// Menangkap data dari App Inventor
$metode = $_POST['metode'];
$koordinat = $_POST['koordinat'];
$total_harga = $_POST['total_harga'];
$produk = $_POST['produk']; // Ingat: Ini harus berisi ANGKA ID Produk!
$jumlah = $_POST['jumlah'];

// Menghitung harga satuan otomatis untuk dimasukkan ke database
$harga_satuan = $total_harga / $jumlah;

// 1. Simpan ke tb_pesanan (id_user pakai 1 karena sudah ada user Farisa)
$sql_pesanan = "INSERT INTO tb_pesanan (id_user, metode_pengambilan, koordinat_lokasi, total_harga) 
                VALUES (1, '$metode', '$koordinat', '$total_harga')";

if ($conn->query($sql_pesanan) === TRUE) {
    $id_pesanan = $conn->insert_id;

    // 2. Simpan ke tb_detail_pesanan (Menggunakan id_produk dan harga_satuan)
    $sql_detail = "INSERT INTO tb_detail_pesanan (id_pesanan, id_produk, jumlah, harga_satuan) 
               VALUES ('$id_pesanan', '$produk', '$jumlah', '$harga_satuan')";
    if ($conn->query($sql_detail) === TRUE) {
        echo "Pesanan Berhasil Disimpan!";
    } else {
        echo "Gagal menyimpan detail: " . $conn->error;
    }
} else {
    echo "Gagal menyimpan pesanan: " . $conn->error;
}

$conn->close();
?>