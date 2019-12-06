<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class Pemesanan extends Model
{

    protected $table = 'hd_pemesanan';
    protected $primaryKey = 'id_pemesanan';
    public $incrementing = true;
    public $timestamps = true;
    public $fillable = ['id_pemesanan', 'no_pemesanan', 'dibuat_oleh', 'dibuat_tgl', 'status', 'mengetahui_oleh', 'id_vendor', 'created_at', 'updated_at'];


}