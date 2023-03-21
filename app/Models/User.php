<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable 
{
    use HasApiTokens, HasFactory, Notifiable, SoftDeletes;
    protected $table = 'users';
    public $timestamps = true;

    protected $dates = ['deleted_at'];
    protected $fillable = array('first_name', 'last_name', 'email', 'phone', 'password', 'email_verified_at', 'address', 'status');
    protected $visible = array('first_name', 'last_name', 'email', 'phone', 'email_verified_at', 'address', 'status');
    protected $hidden = array('password');

    public function products()
    {
        return $this->hasMany('App\Models\Product', 'user_id');
    }

}