<?php

use App\Http\Controllers\CartController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CheckoutController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\MemberController;
use App\Http\Controllers\MembershipController;
use App\Http\Controllers\OptionController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\OrderDetailController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\UserDashboardController;
use App\Models\Cart;
use App\Models\Category;
use App\Models\Order;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;



//______________________      H o m e            ____________________

Route::get('/',[HomeController::class,'index'])->name('home');
Route::get('/product/{id}',[HomeController::class,'show'])->name('product.show');


//_____________________ C A R T___________________________________

Route::get('/cart',[CartController::class,'index'])->name('cart.index');
Route::post('/cart/store',[CartController::class,'store'])->name('cart.store');
Route::post('/cart/update',[CartController::class,'update'])->name('cart.update');
Route::delete('/cart/{id}',[CartController::class,'destroy'])->name('cart.destroy');

// __________________  Order Detail _______________________________

Route::middleware(['auth:sanctum', 'verified'])->get('/orderDetail/{id}',[OrderDetailController::class,'show'])->name('orderDetail.show');


// ________________________ User DASHBOARD,    Checkout,    Orders _________________________________

Route::group(
    
    [
        'middleware' => ['auth:sanctum', 'verified','role:user']
    ],
    function()
    {

        
            Route::get('/dashboard',[UserDashboardController::class,'show'])->name('dashboard');

            Route::get('/checkout',[CheckoutController::class,'index'])->name('checkout.index');

            Route::post('/orders',[OrderController::class,'store'])->name('orders.store');


    }
);

//_____________________________   A d m i n         _____________________________________

Route::group(
    
    [
        'prefix' => 'admin',
        'middleware' => ['auth:sanctum', 'verified','role:admin']

    ]
    , function()
    {

        Route::resource('/categories',CategoryController::class);
        Route::resource('/products',ProductController::class);
        Route::resource('/members',MemberController::class);
        Route::resource('/memberships',MembershipController::class);

        Route::get('/orders',[OrderController::class,'index'])->name('orders.index');
        Route::delete('/orders/{destroy}',[OrderController::class,'destroy'])->name('orders.destroy');
        Route::put('/orders/{update}',[OrderController::class,'update'])->name('orders.update');

        Route::get('/dashboard',[OptionController::class,'index'])->name('dashboard.admin');
        Route::get('/option/{id}/edit',[OptionController::class,'edit'])->name('option.edit');
        Route::put('/dashboard/{id}',[OptionController::class,'update'])->name('option.update');

        Route::get('/payment/{id}',[PaymentController::class,'show'])->name('payment.show');

        
    }
);




