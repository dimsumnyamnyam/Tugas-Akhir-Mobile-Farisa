<?php
$koneksi = mysqli_connect("localhost", "root", "", "db_food_order");

if (!$koneksi) {
    die("Koneksi gagal");
}

$rating = $_POST['rating'];
$ulasan = $_POST['ulasan'];

$query = "INSERT INTO tb_ulasan (rating, teks_ulasan) VALUES ('$rating', '$ulasan')";

if(mysqli_query($koneksi, $query)) {
    echo "Ulasan berhasil disimpan";
} else {
    echo "Gagal: " . mysqli_error($koneksi);
}
?>