<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class PageDetail extends Model
{

    protected $table = 'pages_detail';
    protected $primaryKey = 'id';
    public $incrementing = true;
    public $timestamps = false;
    public $fillable = ['id', 'id_page', 'custom_html'];


}