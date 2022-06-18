<?php
Class Model_history extends Ci_Model{
    
    
    function update($foto){
        
        $data=array(
            'upload_pembayaran'=>$foto
        );
        $user_id= $this->session->userdata('id_users');
        $this->db->where('id_users',$user_id);
        $this->db->update('transaksi',$data);
    }
    
}


?>