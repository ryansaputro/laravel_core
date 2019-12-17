<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class Satuan extends Model
{

    protected $table = 'hd_barang_satuan';
    protected $primaryKey = 'id_satuan';
    public $incrementing = true;
    public $timestamps = true;
    public $fillable = ['id_satuan', 'kode_satuan', 'nama_satuan', 'satuan_terkecil', 'isi', 'keterangan', 'status', 'created_at', 'updated_at'];


}