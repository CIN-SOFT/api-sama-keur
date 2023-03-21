<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration {

	public function up()
	{
		Schema::create('users', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();
			$table->softDeletes();
			$table->string('first_name', 100);
			$table->string('last_name', 100);
			$table->string('email', 100)->unique();
			$table->string('phone', 20)->unique()->nullable();
			$table->string('password', 255);
			$table->datetime('email_verified_at');
			$table->string('address', 200)->nullable();
			$table->enum('status', array('active', 'suspended', 'pending'));
		});
	}

	public function down()
	{
		Schema::drop('users');
	}
}