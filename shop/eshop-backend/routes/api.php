<?php


use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CheckoutController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('/categories', [CategoryController::class, 'show']);
Route::get('/shop', [ProductController::class, 'show']);
Route::get('/shop/categories/{category}', [ProductController::class, 'productsByCategory']);





Route::get('/auth/redirect', [AuthController::class, 'redirect']);
Route::get('/auth/callback', [AuthController::class, 'callback']);
Route::post('/auth/signUpWithEmailAndPassword', [AuthController::class, 'signUpWithEmailAndPassword']);
Route::post('/auth/signInWithEmailAndPassword', [AuthController::class, 'signInWithEmailAndPassword']);


Route::middleware(['auth:sanctum'])->group(function () {
    Route::post('/auth/logout', [AuthController::class, 'logout']);
    Route::post('/addToCart', [CartController::class, 'addToCart']);
    Route::get('/viewCart', [CartController::class, 'viewCart']);
    Route::get('/cartItemCount', [CartController::class, 'cartItemCount']);
    Route::post('/removeItem', [CheckoutController::class, 'removeItem']);
    Route::post('/increseItem', [CheckoutController::class, 'increseItem']);
    Route::post('/dicreseItem', [CheckoutController::class, 'dicreseItem']);
});
