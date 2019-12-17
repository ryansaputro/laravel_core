<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class FotoBarang extends Model
{

    protected $table = 'hd_barang_foto';
    protected $primaryKey = 'id_barang_foto';
    public $incrementing = true;
    public $timestamps = false;
    public $fillable = ['id_barang_foto', 'id_barang', 'image'];


}