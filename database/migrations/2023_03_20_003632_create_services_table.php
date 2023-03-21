<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateServicesTable extends Migration {

	public function up()
	{
		Schema::create('services', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();
			$table->softDeletes();
			$table->string('name');
			$table->text('description')->nullable();
			$table->integer('cost')->nullable();
			$table->integer('user_id')->unsigned();
		});
	}

	public function down()
	{
		Schema::drop('services');
	}
}