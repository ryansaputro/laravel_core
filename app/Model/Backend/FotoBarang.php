<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class FotoBarang extends Model
{

    protected $table = 'hd_barang_foto';
    protected $primaryKey = 'ID';
    public $incrementing = true;
    public $timestamps = false;
    public $fillable = ['ID', 'id_barang', 'image'];


}