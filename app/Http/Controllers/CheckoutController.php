<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

class CheckoutController extends Controller
{
    function index(){
      

        $carts= Cart::with('product')->get();

        return Inertia::render('Checkout',
        [
            'carts' => $carts,
        ]);
    }
}
