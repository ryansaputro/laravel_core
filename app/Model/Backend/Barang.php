<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class Barang extends Model
{
    // protected $guarded = [];
    protected $table = 'hd_barang';
    protected $primaryKey = 'id_barang';
    public $incrementing = true;
    public $timestamps = true;
    public $fillable = ['id_barang', 'kode_barang', 'nama_barang', 'stock', 'stock_minimal', 'id_satuan', 'id_golongan_barang', 'id_jenis_barang', 'deskripsi', 'dibuat_oleh', 'status', 'created_at', 'updated_at'];


}