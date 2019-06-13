<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class Meta extends Model
{

    protected $table = 'meta';
    protected $primaryKey = 'id';
    public $incrementing = true;
    public $timestamps = true;
    public $fillable = ['id', 'name', 'description', 'content', 'status', 'created_at', 'updated_at'];


}