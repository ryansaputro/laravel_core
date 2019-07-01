<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class ArticleLike extends Model
{

    protected $table = 'articles_likes';
    protected $primaryKey = 'id';
    public $incrementing = true;
    public $timestamps = true;
    public $fillable = ['id', 'id_articles', 'id_user', 'ip_address', 'browser', 'platform', 'status', 'created_at', 'updated_at'];


}