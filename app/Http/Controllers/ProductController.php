<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Category;
use Illuminate\Support\Facades\File;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;

class ProductController extends Controller
{
    public function index(){

        $products = Product::with('category')->orderBy('id','desc')->get();

        return Inertia::render('admin/product/index', 
        ['products' => $products]);
    
    }

    public function create(){

        $categories= Category::all();

        return inertia::render('admin/product/create',['categories'=>$categories]);
    }

    public function store(Request $request)
    {

        $request->validate([

            'name' =>['required'],
            'price' => ['required'],
            'keywords' =>['required'],
            'image'=>'required|image|mimes:jpeg,jpg,png',
            'category_id' => ['required'],
        ]);

        $product = new Product;
        $product->name =$request->name;
        $product->price =$request->price;
        $product->keywords =$request->keywords;
        $product->category_id =$request->category_id;

        if($request->hasFile('image')){

            $file=$request->file('image');

            $extension=$file->getClientOriginalExtension();

            $fileName=time().'.'.$extension;

            $file->move('uploads/products/',$fileName);

            $product->image= $fileName;

        }  

        $product->save();

        return Redirect::route('products.index')->with('message','Product Created');
    }

    public function edit(Product $Product){

        $categories= Category::all();

        return inertia::render('admin/product/edit', [
            'product' => [
                'id' => $Product->id,
                'name' => $Product->name,
                'price' => $Product->price,
                'image' => $Product->image,
                'keywords' => $Product->keywords,
                'category' => $Product->category,
            ],
            'categories'=>$categories
        ]);
    }

    public function update(Request $request,$id){

        $request->validate([
            'name' =>['required'],
            'price' => ['required'],
            'keywords' =>['required'],
            'image' => ['nullable', 'image'],
        ]);

        $product= Product::find($id);
        $product->name =$request->name;
        $product->price =$request->price;
        $product->keywords =$request->keywords;
        $product->category_id =$request->category_id;

        $path='uploads/products/'.$product->image;
        
        if($request->hasFile('image')){

            if(File::exists($path)){

                File::delete($path);
            }

            $file=$request->file('image');

            $extension=$file->getClientOriginalExtension();

            $fileName=time().'.'.$extension;

            $file->move('uploads/products/',$fileName);

            $product->image= $fileName;

        }

        $product->update();

        return Redirect::route('products.index')->with('message','Product Updated');

    }

    public function destroy(Product $Product)
    {

        $path='uploads/products/'.$Product->image;

        if(File::exists($path)){

            File::delete($path);

        }

        $Product->delete();

        return Redirect::back()->with('message','Product Deleted');
    }
}
