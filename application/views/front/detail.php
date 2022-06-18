<?php $this->load->view('layouts/header'); ?>
<?php $this->load->view('layouts/smallnavbar'); ?>
<?php $this->load->view('layouts/navbar'); ?>


    <div class="sitemap container">
      <ol class="breadcrumb">
        <li><a href="<?php echo site_url('Welcome') ?>">HOME</a></li>
        <li class="active">DETAIL PRODUCT</li>
      </ol>
    </div><!-- container breadchumb -->

<div class="single-product">
    <div class="container">
        <div class="sp-screenshoot col-md-4">
            <div class="col-md-12">
                <img src="<?php echo base_url()?>uploads/barang/<?php echo $detail['foto'] ?>" class="primary-pic img-responsive" />
            </div>
        </div>
        <div class="sp-deskripsi col-md-4">
            <h3 class="title"><?php echo $detail['nama_barang']; ?></h3>
            <p class="deskripsi">
            <?php echo $detail['deskripsi'] ?>   
            </p>
        </div>
        <div class="col-md-4">
            <div class="sp-cart col-md-12"> 
                <h2 class="harga-baru">Rp.<?php echo number_format($detail['harga_sewa'],'0',',','.'); ?>,-</h2>
                <?php echo form_open('Welcome/chekout'); 
                echo form_hidden('id_barang',$detail['id_barang']);
                ?>
                <label class="label-q" for="quantity">Quantity</label>
                <input class="input-q"  type="number" name="jumlah" id="quantity" placeholder="Jumlah" />
                <label class="label-q" for="tanggal_awal_sewa">Tanggal Awal Sewa</label>
                <input class="input-q"  type="date" name="tanggal_awal_sewa" id="tanggal_awal_sewa" placeholder="Tanggal Sewa" />
                <label class="label-q" for="tanggal_akhir_sewa">Tanggal Akhir Sewa</label>
                <input class="input-q"  type="date" name="tanggal_akhir_sewa" id="tanggal_akhir_sewa" placeholder="Tanggal Akhir Sewa" />
                <button type="submit" name="submit" class="btn btn-cart">ADD TO CART</button>
                
            </div>
            <?php echo form_close(); ?>
        
        </div>
    </div>
</div><!-- single product -->
<?php $this->load->view('layouts/footer'); ?>









