<?php

defined('BASEPATH') or exit('No direct script access allowed');

class M_penjualan extends CI_Model
{

	// get datda pelanggan
	public function pelanggan()
	{
		return $this->db->get_where('pelanggan', ['status' => 1])->result_array();
	}
	// get datda pegawai
	public function pegawai()
	{
		return $this->db->get('pegawai')->result_array();
	}
	// get datda menu
	public function menu()
	{
		return $this->db->get('menu')->result_array();
	}
	// detail item
	public function detail_jual($no_nota)
	{
		$this->db->select('a.no_nota,a.jumlah,a.harga_satuan,a.subtotal,b.id_menu,b.nm_menu')
			->from('detail_jual as a')
			->join('menu as b', 'a.id_menu=b.id_menu')
			->where('a.no_nota', $no_nota);

		return $this->db->get()->result_array();
	}
	//id pelanggan
	private function no_nota()
	{
		$this->db->select('right(no_nota,6) as id', FALSE);
		$this->db->order_by('no_nota', 'DESC');
		$this->db->limit(1);
		$query = $this->db->get('penjualan');
		if ($query->num_rows() <> 0) {
			$data = $query->row();
			$code = intval($data->id) + 1;
		} else {
			$code = 1;
		}

		$interval = str_pad($code, 6, "0", STR_PAD_LEFT);
		$id = 'PNJ-' . $interval;
		return $id;
	}

	public function create_draff()
	{
		$id = $this->no_nota();
		$data = [
			'no_nota'		=> $id,
			'tgl_nota'	=> date('Y-m-d')
		];
		$this->db->insert('penjualan', $data);


		$response = [
			'status'		=> 'OK',
			'no_nota'		=> $id
		];

		return $response;
	}

	public function add_item()
	{
		$no_nota    	= $this->input->post('no_nota');
		$id_pelanggan  = $this->input->post('id_pelanggan');
		$id_pegawai	= $this->input->post('id_pegawai');
		$id_menu		= $this->input->post('id_menu');
		$jumlah		= $this->input->post('jumlah');

		$find_menu	= $this->db->get_where('menu', ['id_menu' => $id_menu])->row_array();
		$validate 	= $this->db->get_where('penjualan', ['no_nota' => $no_nota])->row_array();

		$harga 		= $find_menu['harga'];
		$subtotal		= $harga * $jumlah;
		if ($validate) {
			if ($validate['id_pegawai'] === null || $validate['id_pelanggan'] === null) {
				$penjualan = [
					'id_pelanggan'		=> $id_pelanggan,
					'id_pegawai'		=> $id_pegawai
				];
			}
			$detail_jual = [
				'no_nota'		=> $no_nota,
				'id_menu'		=> $id_menu,
				'jumlah'		=> $jumlah,
				'harga_satuan'	=> $harga,
				'subtotal'	=> $subtotal
			];


			$this->db->trans_start();
			if ($penjualan) {
				$this->db->update('penjualan', $penjualan, ['no_nota' => $no_nota]);
			}
			$this->db->insert('detail_jual', $detail_jual);
			$this->db->trans_complete();


			$response = [
				'status'		=> 'OK',
				'code_status'	=> 1,
				'no_nota'		=> $no_nota
			];

			return $response;
		} else {
			$response = [
				'status'		=> 'Error',
				'code_status'	=> 0,
				'no_nota'		=> $no_nota
			];

			return $response;
		}
	}
}

/* End of file M_penjualan.php */
