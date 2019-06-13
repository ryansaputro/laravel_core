<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class Banner extends Model
{
    // protected $guarded = [];
    protected $table = 'banner';
    protected $primaryKey = 'id';
    public $incrementing = true;
    public $timestamps = true;
    public $fillable = ['id', 'name', 'description', 'data', 'dimension', 'path', 'created_by', 'created_at', 'updated_at'];


}