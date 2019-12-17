<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class PenerimaanDetail extends Model
{

    protected $table = 'hd_penerimaan_detail';
    protected $primaryKey = 'id_penerimaan_detail';
    public $incrementing = true;
    public $timestamps = false;
    public $fillable = ['id_penerimaan_detail', 'id_penerimaan', 'id_barang', 'qty', 'keterangan', 'id_rak', 'tanggal_kadaluarsa', 'no_batch', 'barcode'];


}