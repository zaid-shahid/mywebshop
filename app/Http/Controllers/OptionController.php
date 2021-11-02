<?php

namespace App\Http\Controllers;

use App\Models\Option;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;

class OptionController extends Controller
{
    function index() {

        $options= Option::all();

        return Inertia::render('admin/Dashboard',['options'=>$options]);

    }

    function edit($id) {

        $option= Option::find($id);

        return Inertia::render('admin/option/edit',['option'=>$option]);

    }

    function update(Request $request, $id) {


        $request->validate([
            'website' =>['required', 'min:4'],
            'copyright' => ['required', 'min:4'],
            'email' =>['required', 'email'],
            'phone' => ['required', 'min:4'],
        ]);

        $option= Option::find($id);

        $option->website= $request->website;
        $option->copyright= $request->copyright;
        $option->email= $request->email;
        $option->phone= $request->phone;

        $path='uploads/options/'.$option->logo;

        if($request->hasFile('logo')){

            if(File::exists($path)){

                File::delete($path);
            }

            $file=$request->file('logo');

            $extension=$file->getClientOriginalExtension();

            $fileName=time().'.'.$extension;

            $file->move('uploads/options/',$fileName);

            $option->logo= $fileName;

        }

        $option->update();

        return Redirect::route('dashboard.admin')->with('message','Updated Successfully');

    }
}
