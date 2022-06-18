<?php $this->load->view('layouts/header'); ?>
<?php $this->load->view('layouts/smallnavbar'); ?>
<?php $this->load->view('layouts/navbar'); ?>
<?php
if ($this->session->flashdata('sukses')) {
    echo "<div class='alert alert-info'>";
    echo $this->session->flashdata('sukses');
    echo "</div>";
}
?>
<div class="sitemap container">
    <ol class="breadcrumb">
        <li><a href="<?php echo site_url('Welcome') ?>">HOME</a></li>
        <li class="active">CHECKOUT</li>
    </ol>
</div><!-- container breadchumb -->
<div class="checkout-page">
    <div class="container">
        <div class="row" style="margin-bottom: 70px;">   
            <div class="col-md-1">
            </div>
            <div class="col-md-11">
                <h3>INVOICE </h3>
                <h4>Total Pembayaran: <span style="color: #e74c3c;"><?php  echo number_format($chek['total_sewa_semua'],'0',',','.') ; ?></span></h4>
            </div>
        </div><!-- row -->
        <div class="form-pembeli row">
            <div class="col-md-6">
                <div class="col-md-1">
                </div>
                <div class="col-md-11">
                    <?php echo form_open('Welcome/finis','class="form-horizontal"') ;
                          echo form_hidden('total_harga',$chek['total_sewa_semua']);
                    ?>
                   
                        <div class="form-group">
                            <label class="col-sm-4 control-label">NAMA LENGKAP</label>
                            <div class="col-sm-8">
                                <input type="text" readonly="" class="form-control"  value="<?php echo $chek['username'] ?>"placeholder="Masukan Nama Lengkapmu ">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">ADDRESS</label>
                            <div class="col-sm-8">
                                <textarea class="form-control"  rows="3" placeholder="Masukan Alamat lengkapmu"><?php echo $chek['alamat'] ?></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">No Telepon</label>
                            <div class="col-sm-8">
                                <input type="number" readonly="" class="form-control"  value="<?php echo $chek['no_telp'] ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" name="submit" class="btn-submit pull-right btn btn-default">SUBMIT</button>
                            </div>
                        </div>
                    <?php echo form_close() ?>
                </div>
            </div>
            <div class="col-md-6">
                <h4 style="font-weight: bold; margin-top: 0; margin-bottom: 30px;">INFO LAINNYA:</h4>
                <p>
                Silahkan transfer di no rek : 000001230123123 (BCA), setelah transfer silahkan upload bukti pembayarannya   
                </p>
            </div>
        </div>
    </div><!-- container -->
</div><!-- checkout page -->
