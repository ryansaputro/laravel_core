<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class Golongan extends Model
{

    protected $table = 'hd_barang_golongan';
    protected $primaryKey = 'id_golongan_barang';
    public $incrementing = true;
    public $timestamps = true;
    public $fillable = ['id_golongan_barang', 'kode_golongan', 'nama_golongan', 'status', 'keterangan', 'dibuat_oleh', 'created_at', 'updated_at'];


}