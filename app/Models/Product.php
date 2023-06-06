<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model 
{

    protected $table = 'products';
    public $timestamps = true;

    use SoftDeletes;

    protected $dates = ['deleted_at'];
    protected $fillable = array('name', 'description', 'piece_number', 'status', 'location', 'is_air_conditioned', 'is_ventilated', 'bathroom', 'price', 'price_type', 'user_id');
    protected $visible = array('id', 'name', 'description', 'piece_number', 'status', 'location', 'is_air_conditioned', 'is_ventilated', 'bathroom', 'price', 'price_type', 'user', 'images', 'category', 'comments');

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function category()
    {
        return $this->belongsTo('App\Models\Category', 'category_id');
    }

    public function images()
    {
        return $this->hasMany('App\Models\Image', 'product_id');
    }

    public function comments()
    {
        return $this->hasMany('App\Models\Comment', 'product_id');
    }

}