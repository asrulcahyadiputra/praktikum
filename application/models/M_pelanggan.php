<?php

defined('BASEPATH') or exit('No direct script access allowed');

class M_pelanggan extends CI_Model
{
	public function all()
	{
		return $this->db->get_where('pelanggan', ['status' => 1])->result_array(); //select *  from pelanggan where status = 1
	}
	public function find($id)
	{
		return $this->db->get_where('pelanggan', ['id_pelanggan' => $id])->row_array(); //select * from pelanggan where id_pelanggan = 'PES01'
	}
	//id pelanggan
	private function id_pelanggan()
	{
		$this->db->select('right(id_pelanggan,2) as id', FALSE);
		$this->db->order_by('id_pelanggan', 'DESC');
		$this->db->limit(1);
		$query = $this->db->get('pelanggan');
		if ($query->num_rows() <> 0) {
			$data = $query->row();
			$code = intval($data->id) + 1;
		} else {
			$code = 1;
		}

		$interval = str_pad($code, 2, "0", STR_PAD_LEFT);
		$id = 'PEL' . $interval;
		return $id;
	}

	public function store()
	{
		$id_pelanggan 	= $this->id_pelanggan();
		$nm_pelanggan 	= $this->input->post('nm_pelanggan');
		$no_telp 		= $this->input->post('no_telp');
		$alamat 		= $this->input->post('alamat');
		$tgl_lahir 	= $this->input->post('tgl_lahir');

		$data = [
			'id_pelanggan'		=> $id_pelanggan,
			'nm_pelanggan'		=> $nm_pelanggan,
			'no_telp'			=> $no_telp,
			'alamat'			=> $alamat,
			'tgl_lahir'		=> $tgl_lahir,
		];

		return $this->db->insert('pelanggan', $data);
	}


	public function update()
	{
		$id_pelanggan 	= $this->input->post('id_pelanggan');
		$nm_pelanggan 	= $this->input->post('nm_pelanggan');
		$no_telp 		= $this->input->post('no_telp');
		$alamat 		= $this->input->post('alamat');
		$tgl_lahir 	= $this->input->post('tgl_lahir');

		$data = [
			'nm_pelanggan'		=> $nm_pelanggan,
			'no_telp'			=> $no_telp,
			'alamat'			=> $alamat,
			'tgl_lahir'		=> $tgl_lahir,
		];

		return $this->db->update('pelanggan', $data, ['id_pelanggan' => $id_pelanggan]);
	}

	//fx(1)
	public function delete($id)
	{
		$data = [
			'status'		=> 0
		];

		return $this->db->update('pelanggan', $data, ['id_pelanggan' => $id]);
	}
}

/* End of file M_pelanggan.php */
