<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateReservationsTable extends Migration {

	public function up()
	{
		Schema::create('reservations', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();
			$table->softDeletes();
			$table->integer('product_id')->unsigned();
			$table->integer('user_id')->unsigned();
			$table->enum('status', array('pending', 'confirmed', 'canceled'));
		});
	}

	public function down()
	{
		Schema::drop('reservations');
	}
}