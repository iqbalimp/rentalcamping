<?php

Class Model_barang extends Ci_Model {

    function get_barang($limit, $start) {
        $this->db->select('*'); // <-- There is never any reason to write this line!
        $this->db->from('barang');
        $this->db->join('gallery', 'gallery.id_barang = barang.id_barang');
        $this->db->limit($limit, $start);
        $query = $this->db->get();
        return $query;
    }

    function get_barang_where($id)
    {
        $this->db->select('*');
        $this->db->from('barang');
        $this->db->join('kategori', 'kategori.id_kategori=barang.id_kategori');
        $this->db->join('gallery', 'barang.id_barang = gallery.id_barang');
        $this->db->where('kategori.nama_kategori',$id);
        $query = $this->db->get();
        $result = $query->result_array();
        return $result;
    }

    function get_barang_array($id)
    {
        $query = $this->db->query("SELECT * FROM `barang` JOIN `gallery` ON `barang`.`id_barang` = `gallery`.`id_barang` WHERE `barang`.`id_barang` = ".$id);
        foreach ($query->result() as $row){}
        $datas = array(
            'id_barang' => $row->id_barang,
            'nama_barang' => $row->nama_barang,
            'harga_sewa' => $row->harga_sewa,
            'stock' => $row->stock,
            'id_kategori' => $row->id_kategori,
            'denda' => $row->denda,
            'deskripsi' => $row->deskripsi,
            'id_galeri' => $row->id_galeri,
            'foto' => $row->foto
        );
        return $datas;
    }

    function get_foto($limit, $start)
    {
        $query = $this->db->get('gallery', $limit, $start);
        return $query;
    }

    function join($limit, $start) {
        $id= $this->uri->segment(2);
        $this->db->select('*'); // <-- There is never any reason to write this line!
        $this->db->from('barang');
        $this->db->join('kategori', 'kategori.id_kategori =barang.id_kategori');
        $this->db->join('gallery', 'gallery.id_barang = barang.id_barang');
        $this->db->where('kategori.id_kategori',$id);
        $this->db->limit($limit, $start);
        $this->db->count_all();
        $query = $this->db->get();
        return $query;
        
    }
    
    
    
    function join_br($limit, $start) {
        $this->db->select('*');
        $this->db->from('barang');
        $this->db->join('kategori', 'kategori.id_kategori=barang.id_kategori');
        $this->db->join('gallery', 'barang.id_barang = gallery.id_barang');
        $this->db->limit($limit, $start);
        $query = $this->db->get();
       return $query;
        
    }
    
    
    
    function br() {
        $this->db->select('*');
        $this->db->from('barang');
        $this->db->join('kategori', 'kategori.id_kategori=barang.id_kategori');
        $this->db->join('gallery', 'barang.id_barang = gallery.id_barang');
        $query = $this->db->get();
       return $query;
        
    }
    function paging(){
        $id= $this->uri->segment(2);
        $this->db->select('*');
        $this->db->from('barang');
        $this->db->join('kategori', 'kategori.id_kategori=barang.id_kategori');
        $this->db->join('gallery', 'barang.id_barang = gallery.id_barang');
        $this->db->where('kategori.nama_kategori',$id);
        $query = $this->db->get();
       return $query;
    }

    
            
        
    function add($foto) {
        $data = array(
            'nama_barang' => $this->input->post('nama_barang'),
            'harga_sewa' => $this->input->post('harga_sewa'),
            'id_kategori' => $this->input->post('kategori'),
            'deskripsi' => $this->input->post('deskripsi'),
            'stock' => $this->input->post('stock')
        );
        
        $this->db->insert('barang', $data);
        $query = $this->db->query("SELECT MAX(id_barang) as idbarang FROM barang");
        foreach ($query->result() as $row)
        {
                echo $row->idbarang;
        }
        $datas = array(
            'id_barang' => $row->idbarang,
            'foto' => $foto
        );
        // echo '<pre>'; print_r($datas); echo '</pre>';die();
        $this->db->insert('gallery', $datas);

        
    }

    function edit($foto) {
        if (empty($foto)) {
            $data = array(
                'nama_barang' => $this->input->post('nama_barang'),
                'harga_sewa' => $this->input->post('harga_sewa'),
                'id_kategori' => $this->input->post('kategori'),
                'deskripsi' => $this->input->post('deskripsi'),
                'stock' => $this->input->post('stock'),
                'deskripsi' => $this->input->post('deskripsi')
            );
            $id = $this->input->post('id_barang');
            $this->db->where('id_barang', $id);
            $this->db->update('barang', $data);
        } else {
            $data = array(
                'nama_barang' => $this->input->post('nama_barang'),
                'harga_sewa' => $this->input->post('harga_sewa'),
                'id_kategori' => $this->input->post('kategori'),
                'deskripsi' => $this->input->post('deskripsi'),
                'stock' => $this->input->post('stock'),
                'deskripsi' => $this->input->post('deskripsi')
            );
            $datas = array(
                'id_barang' => $this->input->post('id_barang'),
                'foto' => $foto
            );
            $id = $this->input->post('id_barang');
            $this->db->where('id_barang', $id);
            $this->db->update('barang',$data);
            $this->db->where('id_galeri', $id);
            $this->db->update('gallery',$datas);

        }
    }

}

?>