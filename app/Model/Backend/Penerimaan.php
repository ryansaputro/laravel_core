<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class Penerimaan extends Model
{

    protected $table = 'hd_penerimaan';
    protected $primaryKey = 'id_penerimaan';
    public $incrementing = true;
    public $timestamps = true;
    public $fillable = ['id_penerimaan', 'no_penerimaan', 'no_faktur', 'id_pemesanan', 'diterima_oleh', 'mengetahui_oleh', 'tanggal_penerimaan', 'catatan', 'created_at', 'updated_at'];


}