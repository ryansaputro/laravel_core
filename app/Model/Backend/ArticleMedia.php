<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class ArticleMedia extends Model
{

    protected $table = 'articles_media';
    protected $primaryKey = 'id';
    public $incrementing = true;
    public $timestamps = true;
    public $fillable = ['id', 'id_articles', 'media', 'extension', 'created_at', 'updated_at'];


}