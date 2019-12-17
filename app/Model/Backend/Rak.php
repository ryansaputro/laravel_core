<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class Rak extends Model
{

    protected $table = 'hd_rak';
    protected $primaryKey = 'id_rak';
    public $incrementing = true;
    public $timestamps = true;
    public $fillable = ['id_rak', 'kode_rak', 'id_gudang', 'nama_rak', 'status', 'keterangan', 'dibuat_oleh', 'created_at', 'updated_at'];


}