<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Service extends Model 
{

    protected $table = 'services';
    public $timestamps = true;

    use SoftDeletes;

    protected $dates = ['deleted_at'];
    protected $fillable = array('name', 'description', 'cost');
    protected $visible = array('name', 'description', 'cost');

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

}