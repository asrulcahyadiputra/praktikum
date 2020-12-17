<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><?= $title ?></title>

</head>

<body>
	<form action="<?= site_url('Penjualan/add_item') ?>" method="POST">
		<input type="hidden" name="no_nota" value="<?= $id ?>">
		<label for="">Pelanggan</label> <br>
		<select name="id_pelanggan" id="id_pelanggan">
			<option value="">-pilih pelanggan-</option>
			<?php foreach ($pelanggan as $p) : ?>
				<option value="<?= $p['id_pelanggan'] ?>"><?= $p['id_pelanggan'] . ' ' . $p['nm_pelanggan'] ?></option>
			<?php endforeach ?>
		</select> <br>

		<label for="">Pegawai</label> <br>
		<select name="id_pegawai" id="id_pegawai">
			<option value="">-pilih pegawai-</option>
			<?php foreach ($pegawai as $g) : ?>
				<option value="<?= $g['id_pegawai'] ?>"><?= $g['id_pegawai'] . ' ' . $g['nm_pegawai'] ?></option>
			<?php endforeach ?>
		</select> <br>

		<label for="">Menu</label> <br>
		<select name="id_menu" id="id_menu">
			<option value="">-pilih menu-</option>
			<?php foreach ($menu as $m) : ?>
				<option value="<?= $m['id_menu'] ?>"><?= $m['id_menu'] . ' ' . $m['nm_menu'] . ' ' . $m['harga'] ?></option>
			<?php endforeach ?>
		</select> <br>

		<label for="">Jumlah</label> <br>
		<input type="number" name="jumlah" id="jumlah" min="0"> <br>
		<br>
		<button type="submit">Tambahkan Item</button>
		<br>
	</form>
	<br><br>
	<table border="1">
		<thead>
			<tr>
				<th>No</th>
				<th>Menu</th>
				<th>Harga Satuab</th>
				<th>Qty</th>
				<th>Subtotal</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$no = 1;
			$total = 0;
			foreach ($detail as $pnj) : ?>
				<tr>
					<td><?= $no++ ?></td>
					<td><?= $pnj['nm_menu'] ?></td>
					<td><?= $pnj['jumlah'] ?></td>
					<td><?= $pnj['harga_satuan'] ?></td>
					<td><?= $pnj['subtotal'] ?></td>
					<?php $total = $total + $pnj['subtotal'] ?>
				</tr>
			<?php endforeach ?>
			<tr>
				<td colspan="4">Total</td>
				<td><?= $total ?></td>
			</tr>
		</tbody>
		<a href="">Selesai</a>
	</table>
</body>

</html>
