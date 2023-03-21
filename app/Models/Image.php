<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Image extends Model 
{

    protected $table = 'images';
    public $timestamps = true;

    use SoftDeletes;

    protected $dates = ['deleted_at'];
    protected $fillable = array('name', 'type');
    protected $visible = array('name', 'type');

    public function product()
    {
        return $this->belongsTo('App\Models\User', 'product_id');
    }

}