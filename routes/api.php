<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CommentController;

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
    Route::resource('category', CategoryController::class);
    Route::resource('product', ProductController::class);
    Route::resource('comment', CommentController::class);
});

Route::get('/login', function () {
    return response()->json(["Erreur" => "Vous n'etes pas autorise a acceder a cette ressource"], 401);
})->name('login');


Route::prefix('v1')->group(function(){
    Route::get('list/category', [CategoryController::class, 'categoryList']);
    Route::get('list/products/{elementsNumber}', [ProductController::class, 'listProductsWithoutFilter']);
    Route::get('details/product/{productId}', [ProductController::class, 'getDetailsProduct']);
});