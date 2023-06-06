<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Laravel\Sanctum\Contracts\HasApiTokens;

class Category extends Model 
{
    use  SoftDeletes;

    protected $table = 'categories';
    public $timestamps = true;

    protected $dates = ['deleted_at'];
    protected $fillable = array('name', 'status');
    protected $visible = array('name', 'status');

	/**
	 * Get the access tokens that belong to model.
	 * @return \Illuminate\Database\Eloquent\Relations\MorphMany
	 */
	public function tokens() {
	}
	
	/**
	 * Determine if the current API token has a given scope.
	 *
	 * @param string $ability
	 * @return bool
	 */
	public function tokenCan(string $ability) {
	}
	
	/**
	 * Create a new personal access token for the user.
	 *
	 * @param string $name
	 * @param array $abilities
	 * @return \Laravel\Sanctum\NewAccessToken
	 */
	public function createToken(string $name, array $abilities) {
	}
	
	/**
	 * Get the access token currently associated with the user.
	 * @return \Laravel\Sanctum\Contracts\HasAbilities
	 */
	public function currentAccessToken() {
	}
	
	/**
	 * Set the current access token for the user.
	 *
	 * @param \Laravel\Sanctum\Contracts\HasAbilities $accessToken
	 * @return HasApiTokens
	 */
	public function withAccessToken($accessToken) {
	}
}