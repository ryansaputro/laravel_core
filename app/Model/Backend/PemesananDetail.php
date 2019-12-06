<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class PemesananDetail extends Model
{

    protected $table = 'hd_pemesanan_detail';
    protected $primaryKey = 'id_pemesanan_detail';
    public $incrementing = true;
    public $timestamps = false;
    public $fillable = ['id_pemesanan_detail', 'id_pemesanan', 'id_barang', 'qty', 'keterangan'];


}