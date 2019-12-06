<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class Category extends Model
{

    protected $table = 'articles_category';
    protected $primaryKey = 'id';
    public $incrementing = true;
    public $timestamps = true;
    public $fillable = ['id', 'name', 'status', 'created_by', 'created_at', 'updated_at'];


}