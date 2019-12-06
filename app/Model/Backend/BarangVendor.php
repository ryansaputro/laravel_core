<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class BarangVendor extends Model
{
    // protected $guarded = [];
    protected $table = 'hd_barang_vendor';
    protected $primaryKey = 'id';
    public $incrementing = true;
    public $timestamps = true;
    public $fillable = ['id', 'id_barang', 'id_vendor', 'id_satuan', 'qty', 'harga_beli', 'harga_jual', 'tanggal_kadaluarsa', 'dibuat_oleh', 'created_at', 'updated_at'];


}