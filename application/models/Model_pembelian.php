<?php

Class Model_pembelian extends Ci_Model {

    function add() {

        $data = array(
            'nama_lengkap' => $this->input->post('nama_lengkap'),
            'alamat' => $this->input->post('alamat'),
            'negara' => $this->input->post('negara'),
            'kode_pos' => $this->input->post('kode_pos'),
            'username' => $this->input->post('username'),
            'password' => md5($this->input->post('password')),
            'total_harga' => $this->input->post('total_harga')
        );
        $this->db->insert('users', $data);
    }

    function edit() {


        $data = array(
            'nama_lengkap' => $this->input->post('nama_lengkap'),
            'alamat' => $this->input->post('alamat'),
            'negara' => $this->input->post('negara'),
            'kode_pos' => $this->input->post('kode_pos'),
            'username' => $this->input->post('username'),
            'password' => md5($this->input->post('password')),
            'total_harga' => $this->input->post('total_harga')
        );
        $id = $this->input->post('id_pembeli');
        $this->db->where('id_pembeli', $id);
        $this->db->update('users', $data);
    }

    function register() {
        $data = array(
                    'nama_lengkap' => $this->input->post('nama_lengkap'),
                    'alamat' => $this->input->post('alamat'),
                    'no_telp' => $this->input->post('no_telp'),
                    'role' => $this->input->post('role'),
                    'username' => $this->input->post('username'),
                    'password' => md5($this->input->post('password'))
        );
        $session=  $this->session->set_userdata($data);
        $this->db->insert('users',$data);
        return $this->db->insert_id();
        $id_barang= $this->input->post('id_barang');
        $this->session->set_userdata(array('id_barang'=>$id_barang));
    }
    
    function transaksi($id,$id_barang){
        $data=array(
            'id_users'=>$id,
            'tanggal_awal_sewa' => $this->input->post('tanggal_awal_sewa'),
            'tanggal_akhir_sewa' => $this->input->post('tanggal_akhir_sewa'),
            'jumlah_barang'=> $this->session->userdata('jumlah'),
            'status' => $this->input->post('status'),
            'total_sewa_semua' => $this->input->post('total_sewa_semua'),
        );
        $this->db->insert('transaksi', $data);
        return $this->db->insert_id();
        $this->session->set_userdata($data,$id_barang);
    }
    function peminjaman($id_transaksi, $id_barang)
    {
        $query = $this->db->query("SELECT barang.id_barang,barang.harga_sewa FROM barang WHERE barang.id_barang = ".$id_barang);
        foreach ($query->result() as $row)
        $totalsewa = $row->harga_sewa * $this->session->userdata('jumlah');
        $data=array(
            'id_transaksi' => $id_transaksi,
            'id_barang' => $id_barang,
            'jumlah_sewa' => $this->session->userdata('jumlah'),
            'total_sewa' => $totalsewa
        );
        $this->db->insert('peminjaman', $data);
        $this->session->set_userdata($data);
        $qur = $this->db->query("SELECT p.id_transaksi,SUM(p.total_sewa) AS totalsewasemua FROM peminjaman AS p WHERE p.id_transaksi = ".$id_transaksi);
        foreach ($qur->result() as $rows)
        $this->db->set('total_sewa_semua', $rows->totalsewasemua, FALSE);
        $this->db->where('id_transaksi', $id_transaksi);
        $this->db->update('transaksi');
    }
}

?>