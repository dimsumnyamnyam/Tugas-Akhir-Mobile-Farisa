<?php
$host = "localhost";
$user = "root";
$pass = "";
$db   = "db_food_order";

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die("Koneksi gagal");
}

// Menangkap inputan dari MIT App Inventor
$username = $_POST['username']; 
$password = $_POST['password']; 

// Mencari data di tabel tb_users (kita gunakan kolom nama_lengkap sebagai username)
$sql = "SELECT * FROM tb_users WHERE nama_lengkap = '$username' AND password = '$password'";
$result = $conn->query($sql);

// Jika ditemukan minimal 1 baris data yang cocok
if ($result->num_rows > 0) {
    echo "sukses";
} else {
    echo "gagal";
}

$conn->close();
?>