<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration {

	public function up()
	{
		Schema::create('products', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();
			$table->softDeletes();
			$table->string('name', 255);
			$table->longText('description');
			$table->smallInteger('piece_number');
			$table->integer('user_id')->unsigned();
			$table->enum('status', array('pending', 'onsale', 'sold', 'expired', 'occupied', 'reserved'));
			$table->integer('category_id')->unsigned()->nullable();
			$table->string('location', 255);
			$table->boolean('is_air_conditioned')->nullable()->default(false);
			$table->boolean('is_ventilated')->nullable()->default(false);
			$table->smallInteger('bathroom');
			$table->integer('price');
			$table->string('price_type', 20)->nullable();
		});
	}

	public function down()
	{
		Schema::drop('products');
	}
}