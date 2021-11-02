<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

class HomeController extends Controller
{
    function index(Request $request){

        if($request->search){

        $products= Product::where('keywords','Like','%'.$request->search.'%')->paginate();

        }elseif($request->category_id){

            $products = Product::where('category_id',$request->category_id)->paginate();

        }else{

            $products = Product::paginate(6);
            
        }

        return Inertia::render('Home',['products'=>$products ]);

    }

    function show($id){

        $product= Product::find($id);

        $categories= Category::all();
        $carts= Cart::all();

        return Inertia::render('Home',
        ['pro'=>$product,
        'categories'=>$categories,
        'carts'=>$carts,
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
    ]);
    }

}
