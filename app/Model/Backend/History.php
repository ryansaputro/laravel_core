<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class History extends Model
{

    protected $table = 'log';
    protected $primaryKey = 'id';
    public $incrementing = true;
    public $timestamps = false;
    public $fillable = ['id', 'id_data', 'table_data', 'field', 'values', 'event', 'created_at'];


}