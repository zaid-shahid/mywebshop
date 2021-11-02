<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Category;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

class UserDashboardController extends Controller
{
    Public function show() {

        $orders = Order::where('user_id',Auth::user()->id)->get();
    
        return Inertia::render('Dashboard',['orders' => $orders ]);
    }
}
