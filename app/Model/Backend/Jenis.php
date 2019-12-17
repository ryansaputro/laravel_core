<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class Jenis extends Model
{

    protected $table = 'hd_barang_jenis';
    protected $primaryKey = 'id_jenis_barang';
    public $incrementing = true;
    public $timestamps = true;
    public $fillable = ['id_jenis_barang', 'kode_jenis_barang', 'nama_jenis_barang', 'status', 'keterangan', 'dibuat_oleh', 'created_at', 'updated_at'];


}