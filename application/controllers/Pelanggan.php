<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Pelanggan extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_pelanggan', 'pelanggan');
	}


	public function index()
	{
		$data = [
			'title'		=> 'Master Pelanggan',
			'pelanggan'	=> $this->pelanggan->all()
		];

		$this->load->view('pelanggan/pelanggan_list', $data);
	}
	// function buat menampilkan form tambah data
	public function insert()
	{
		$data = [
			'title'		=> 'Master Pelanggan',
		];

		$this->load->view('pelanggan/pelanggan_add', $data);
	}
	// function untuk aksi tambah data
	public function store()
	{
		$this->pelanggan->store();
		redirect('Pelanggan');
	}

	// function buat menampilkan form edit
	public function edit($id)
	{
		$data = [
			'title'		=> 'Master Pelanggan',
			'pelanggan'	=> $this->pelanggan->find($id)
		];

		$this->load->view('pelanggan/pelanggan_edit', $data);
	}
	// function untuk aksi update -edit
	public function update()
	{
		$this->pelanggan->update();
		redirect('Pelanggan');
	}

	public function hapus($id)
	{
		$this->pelanggan->delete($id);
		redirect('Pelanggan');
	}
}

/* End of file Pelanggan.php */
