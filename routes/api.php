<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/
Route::controller(AuthController::class)->group(function(){
    Route::post('auth/register', 'register');
    Route::post('auth/login', 'login');
    Route::post('auth/reset-password', 'requestPasswordChange');
});


Route::middleware('auth:sanctum')->group(function () {
    Route::post('category', [CategoryController::class, 'store']);
    Route::put('category', [CategoryController::class, 'update']);
    Route::delete('category', [CategoryController::class, 'delete']);

    Route::resource('products', ProductController::class);
});

Route::prefix('v1')->group(function(){

});