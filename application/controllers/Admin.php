<?php

Class Admin extends CI_Controller {

     function __construct() {
        parent::__construct();
        $this->load->library('pdf');
        $this->load->Model('Model_admin');
        $this->load->Model('Model_penjualan');
        $this->load->Model('Model_report');
       
    }
    function index() {
        $this->load->view('admin/login');
    }

    function login() {
        if (isset($_POST['submit'])) {
            $username             = $this->input->post('username');
            $password             = md5($this->input->post('password'));
            $chek                 = $this->Model_admin->chek_login($username,$password);
            $chek_pembeli         = $this->Model_penjualan->chek_login($username,$password);
            if (!empty($chek)) {
                $this->session->set_userdata($chek);
                redirect('Dashboard');
            } elseif (!empty($chek_pembeli)) {
                $this->session->set_userdata($chek_pembeli);
                $this->session->set_userdata(array('level' => 1));
                redirect('Dashboard');
            }else{
                $this->session->set_flashdata('salah', 'WAH BERAT BOS USERNAME DAN PASSWORD NYA SALA YA BOS !!');
                $this->load->view('Admin/login');
            }
        } else {
            $this->load->view('Admin/login');
        }
    }
    
    
    function logout()
    {
        $this->session->sess_destroy();
        redirect('Admin');
    }
    
    function Report(){
        $data['report']= $this->db->query("SELECT ts.tanggal,pm.id_pembeli,ts.qty,ts.id_transaksi,tb.nama_barang,tb.harga_barang,tk.nama_kategori,tb.foto,ts.status,pm.alamat,pm.username,pm.password FROM tbl_transaksi as ts, tbl_barang as tb,tbl_kategori as tk, pembeli as pm WHERE ts.id_pembeli=pm.id_pembeli AND tb.id_kategori=tk.id_kategori AND ts.id_barang=tb.id_barang")->result();
        $this->load->view('report',$data);
    }

    function Cetak(){
        $pdf = new FPDF('l','mm','A5');
        // membuat halaman baru
        $pdf->AddPage();
        // setting jenis font yang akan digunakan
        $pdf->SetFont('Arial','B',16);
        // mencetak string
        $pdf->Cell(190,7,'Laporan Penjualan',0,1,'C');
        $pdf->SetFont('Arial','B',12);
        // Memberikan space kebawah agar tidak terlalu rapat
        $pdf->Cell(10,7,'',0,1);
        $pdf->SetFont('Arial','B',10);
        $pdf->Cell(40,6,'Tanggal',1,0);
        $pdf->Cell(30,6,'Nama Pembeli',1,0);
        $pdf->Cell(24,6,'Harga',1,0);
        $pdf->Cell(50,6,'Nama Barang',1,0);
        $pdf->Cell(20,6,'Quantity',1,0);
        $pdf->Cell(24,6,'Quantity',1,1);
        $pdf->SetFont('Arial','',10);
        $data = $this->Model_report->hasil();
        $total=0; foreach ($data as $row){
            $pdf->Cell(40,6,$row->tanggal,1,0);
            $pdf->Cell(30,6,$row->username,1,0);
            $pdf->Cell(24,6,$row->harga_barang,1,0);
            $pdf->Cell(50,6,$row->nama_barang,1,0);
            $pdf->Cell(20,6,$row->qty,1,0);
            $pdf->Cell(24,6,$total=$row->qty*$row->harga_barang,1,1);
        }
        $pdf->Output();
    }

}

?>