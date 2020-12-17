<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><?= $title ?></title>
</head>

<body>
	<form action="<?= site_url('Pelanggan/update') ?>" method="POST">

		<label for="">ID Pelanggan</label> <br>
		<input type="text" name="id_pelanggan" id="id_pelanggan" value="<?= $pelanggan['id_pelanggan'] ?>" readonly> <br>

		<label for="">Nama Pelanggan</label> <br>
		<input type="text" name="nm_pelanggan" id="nm_pelanggan" value="<?= $pelanggan['nm_pelanggan'] ?>"> <br>

		<label for="">Tanggal Lahir</label> <br>
		<input type="date" name="tgl_lahir" id="tgl_lahir" value="<?= $pelanggan['tgl_lahir'] ?>"> <br>

		<label for="">No Telepon</label> <br>
		<input type="number" name="no_telp" id="no_telp" value="<?= $pelanggan['no_telp'] ?>"> <br>

		<label for="">Alamat</label> <br>
		<textarea name="alamat" id="alamat" cols="30" rows="5"><?= $pelanggan['alamat'] ?></textarea>

		<br>
		<button type="submit">Simpan Perubahan</button>

	</form>
</body>

</html>
