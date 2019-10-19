<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class Article extends Model
{

    protected $table = 'articles';
    protected $primaryKey = 'id';
    public $incrementing = true;
    public $timestamps = true;
    public $fillable = ['id', 'title', 'description', 'status', 'id_category', 'youtube_link', 'created_by', 'created_at', 'updated_at'];


}