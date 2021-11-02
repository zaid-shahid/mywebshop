<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Category;
use App\Models\Product;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

class CartController extends Controller
{
    function index(){
        
        $carts= Cart::with('Product')->get();


        return Inertia::render('Cart',['carts'=>$carts]);

    }
    function store(Request $request){

        $count=Cart::where('product_id',$request->product_id)->count();

        if($count===0){

        $cart=new Cart;

        $cart->quantity=$request->quantity;
        $cart->product_id=$request->product_id;

        $cart->save();

        return Redirect::back()->with('message','Added Successfully');

        }

        return Redirect::back()->with('message','Already in Cart,<br>Please Visit Cart to Update the Quantity');


    }

    function destroy($id){

        Cart::find($id)->delete();

        return Redirect::back();


    }

    function update(Request $request){

        $carts=$request->carts;

        foreach ($carts as $cart){


            $update_cart=Cart::find($cart['id']);

            $update_cart->quantity=$cart['quantity'];

            $update_cart->update();

        }

        return Redirect::back();

    }
}
