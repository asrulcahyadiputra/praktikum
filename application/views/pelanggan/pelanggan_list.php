<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><?= $title ?></title>

</head>

<body>
	<a href="<?= site_url('Pelanggan/insert') ?>">(+) Tambah Data</a>
	<br>
	<br>
	<table border="1">
		<thead>
			<tr>
				<th>No</th>
				<th>ID Pelanggan</th>
				<th>Nama Pelanggan</th>
				<th>Alamat</th>
				<th>No Telepon</th>
				<th>TGL Lahir</th>
				<th>Aksi</th>
			</tr>
		</thead>
		<tbody>
			<?php $no = 1;
			foreach ($pelanggan as $row) : ?>
				<tr>
					<td><?= $no++ ?></td>
					<td><?= $row['id_pelanggan'] ?></td>
					<td><?= $row['nm_pelanggan'] ?></td>
					<td><?= $row['alamat'] ?></td>
					<td><?= $row['no_telp'] ?></td>
					<td><?= $row['tgl_lahir'] ?></td>
					<td>
						<a href="<?= site_url('Pelanggan/edit/' . $row['id_pelanggan']) ?>">Edit</a>
						<a href="<?= site_url('Pelanggan/hapus/' . $row['id_pelanggan']) ?>">Hapus</a>
					</td>

				</tr>
			<?php endforeach ?>
		</tbody>
	</table>
</body>

</html>
