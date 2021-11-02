<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Auth\Events\Validated;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Inertia\Inertia;

class CategoryController extends Controller
{
    public function index(){

        $categories = Category::all();

        return Inertia::render('admin/category/index', ['categories' => $categories]);
    
    }

    public function create(){

        return inertia::render('admin/category/create');
    }

    public function store(Request $request)
    {
        
        $request->validate([
            'title' => 'required|min:3',
        ]);
        
        $category= new Category;
        $category->title=$request->title;

        $category->save();

        return Redirect::route('categories.index')->with('message','Category Created');
    }

    public function edit(Category $category){

        return inertia::render('admin/category/edit', [
            'category' => [
                'id' => $category->id,
                'title' => $category->title
                ]
        ]);
    }

    public function update(Request $request,Category $category){

        $request->validate([
            'title' => 'required|min:3',
        ]);
        
        $category->title=$request->title;

        $category->update();

        return Redirect::route('categories.index')->with('message','Category Updated');;

    }

    public function destroy(category $category)
    {
        $category->delete();

        return  Redirect::back()->with('message','Category Deleted');;
    }
}
