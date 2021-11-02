<?php

namespace App\Http\Controllers;

use App\Models\OrderDetail;
use Illuminate\Http\Request;
use Inertia\Inertia;

class OrderDetailController extends Controller
{
    public function show($id){

        $orderDetail = OrderDetail::with('product')->find($id);

        if(auth()->user()->id==1){

            return Inertia::render('admin/order/OrderItems', ['orderDetail' => $orderDetail]);

        }

        return Inertia::render('OrderItems', ['orderDetail' => $orderDetail]);
    
    }
}
