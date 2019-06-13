<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class Page extends Model
{

    protected $table = 'pages';
    protected $primaryKey = 'id';
    public $incrementing = true;
    public $timestamps = true;
    public $fillable = ['id', 'name', 'url', 'pages_type', 'status', 'created_by', 'created_at', 'updated_at'];


}