<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class Vendor extends Model
{

    protected $table = 'hd_vendor';
    protected $primaryKey = 'id_vendor';
    public $incrementing = true;
    public $timestamps = true;
    public $fillable = ['id_vendor', 'kode_vendor', 'nama_vendor', 'alamat_vendor', 'tlp_vendor', 'pimpinan', 'status', 'keterangan', 'dibuat_oleh', 'created_at', 'updated_at'];


}