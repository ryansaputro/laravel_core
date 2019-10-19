<?php
namespace App\Model\Backend;


use Illuminate\Database\Eloquent\Model;


class ArticleComment extends Model
{

    protected $table = 'articles_comments';
    protected $primaryKey = 'id';
    public $incrementing = true;
    public $timestamps = true;
    public $fillable = ['id', 'id_articles', 'id_user', 'comment', 'ip_address', 'browser', 'platform', 'status', 'created_at', 'updated_at'];


}