<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class DataApotek extends Model
{
    // protected $guarded = [];
    protected $table = 'hd-data_apotek';
    protected $primaryKey = 'id';
    public $incrementing = true;
    public $timestamps = true;
    public $fillable = ['id_apotek', 'kode', 'nama', 'telepon', 'email', 'alamat', 'penanggung_jawab', 'created_at', 'updated_at'];


}