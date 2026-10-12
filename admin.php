<?php
$koneksi = mysqli_connect("localhost", "root", "", "db_food_order");
$query = "SELECT * FROM tb_pesanan ORDER BY waktu_pesan DESC";
$result = mysqli_query($koneksi, $query);
?>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard Admin - Dimsum & Risol</title>
    <style>
        body { font-family: sans-serif; padding: 20px; }
        table { border-collapse: collapse; width: 100%; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #007BFF; color: white; }
        .btn-excel { 
            background-color: #28a745; 
            color: white; 
            padding: 10px 15px; 
            text-decoration: none; 
            border-radius: 5px; 
            font-weight: bold;
        }
    </style>
</head>
<body>

    <h2>Rekapitulasi Data Pesanan</h2>
    
    <!-- Tombol untuk cetak Excel -->
    <a href="export_excel.php" class="btn-excel">📥 Ekspor ke Excel</a>

    <table>
        <tr>
            <th>ID Pesanan</th>
            <th>Waktu Pesan</th>
            <th>Metode</th>
            <th>Status</th>
            <th>Total Harga</th>
        </tr>
        <?php while($row = mysqli_fetch_assoc($result)) { ?>
        <tr>
            <td><?= $row['id_pesanan'] ?></td>
            <td><?= $row['waktu_pesan'] ?></td>
            <td><?= $row['metode_pengambilan'] ?></td>
            <td><?= $row['status_pesanan'] ?></td>
            <td>Rp<?= number_format($row['total_harga'], 0, ',', '.') ?></td>
        </tr>
        <?php } ?>
    </table>

</body>
</html>