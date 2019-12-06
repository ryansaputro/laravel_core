<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class Permission extends Model
{

    protected $table = 'permissions';
    protected $primaryKey = 'id';
    public $incrementing = true;
    public $timestamps = true;
    public $fillable = ['id', 'name', 'guard_name', 'created_at', 'updated_at'];


}