<?php
// Perintah ajaib PHP agar file ini di-download sebagai Excel
header("Content-type: application/vnd-ms-excel");
header("Content-Disposition: attachment; filename=Laporan_Pesanan.xls");

$koneksi = mysqli_connect("localhost", "root", "", "db_food_order");
$query = "SELECT * FROM tb_pesanan ORDER BY waktu_pesan DESC";
$result = mysqli_query($koneksi, $query);
?>

<!-- Kita menggunakan tabel HTML biasa, Excel akan otomatis membacanya -->
<table border="1">
    <tr>
        <th>ID Pesanan</th>
        <th>Waktu Pesan</th>
        <th>Metode Pengambilan</th>
        <th>Status Pesanan</th>
        <th>Total Harga</th>
    </tr>
    <?php while($row = mysqli_fetch_assoc($result)) { ?>
    <tr>
        <td><?= $row['id_pesanan'] ?></td>
        <td><?= $row['waktu_pesan'] ?></td>
        <td><?= $row['metode_pengambilan'] ?></td>
        <td><?= $row['status_pesanan'] ?></td>
        <td><?= $row['total_harga'] ?></td>
    </tr>
    <?php } ?>
</table>