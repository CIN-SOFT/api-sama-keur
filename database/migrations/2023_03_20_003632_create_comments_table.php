<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCommentsTable extends Migration {

	public function up()
	{
		Schema::create('comments', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();
			$table->softDeletes();
			$table->text('content');
			$table->integer('user_id')->unsigned();
			$table->integer('product_id')->unsigned();
			$table->enum('note', array('1', '2', '3', '4', '5'));
		});
	}

	public function down()
	{
		Schema::drop('comments');
	}
}