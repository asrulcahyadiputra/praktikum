<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Penjualan extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model('M_penjualan', 'penjualan');
	}


	public function index()
	{
		$data = [
			'title'		=> 'Transaksi Penjualan'
		];
		$this->load->view('penjualan/penjualan_list', $data);
	}

	public function insert()
	{
		$request = $this->penjualan->create_draff();

		redirect('Penjualan/create/' . $request['no_nota']);
	}

	public function create($id)
	{
		$data = [
			'title'		=> 'Buat Penjualan Baru',
			'id'			=> $id,
			'pelanggan'	=> $this->penjualan->pelanggan(),
			'pegawai'		=> $this->penjualan->pegawai(),
			'menu'		=> $this->penjualan->menu(),
			'detail'		=> $this->penjualan->detail_jual($id)
		];
		$this->load->view('penjualan/penjualan_create', $data);
	}
	public function add_item()
	{
		$request = $this->penjualan->add_item();

		redirect('Penjualan/create/' . $request['no_nota']);
	}
}

/* End of file Penjualan.php */
