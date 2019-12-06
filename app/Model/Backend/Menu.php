<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class Menu extends Model
{

    protected $table = 'menus';
    protected $primaryKey = 'id';
    public $incrementing = true;
    public $timestamps = true;
    public $fillable = ['id', 'icon', 'name', 'depth', 'rgt', 'lft', 'id_parent', 'url', 'description', 'status', 'order', 'menu_role',  'created_at', 'updated_at', 'created_by'];


}