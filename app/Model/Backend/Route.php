<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class Route extends Model
{

    protected $table = 'routes';
    protected $primaryKey = 'id';
    public $incrementing = true;
    public $timestamps = true;
    public $fillable = ['id', 'url', 'name_as', 'uses_controller', 'created_by', 'created_at', 'updated_at'];


}