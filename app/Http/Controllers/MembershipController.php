<?php

namespace App\Http\Controllers;
use App\Models\Membership;
use App\Models\UserType;
use Inertia\Inertia;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;

class MembershipController extends Controller
{
    public function index(){


        $memberships = UserType::where('type','!=', 'admin')->get();

        return Inertia::render('admin/membership/index', ['memberships' => $memberships]);
    
    }

    public function create(){

        return inertia::render('admin/membership/create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'type' => ['required'],
            'discount' => ['required','integer'],
        ]);

        $membership= new UserType;
        $membership->type= $request->type;
        $membership->discount= $request->discount;
        $membership->save();


        return Redirect::route('memberships.index')->with('message','Membership Created');
    }

    public function edit(UserType $Membership){

        if($Membership->id==1){

            abort(code:403);
        }

        return inertia::render('admin/membership/edit', [
            'membership' => [
                'id' => $Membership->id,
                'type' => $Membership->type,
                'discount' => $Membership->discount,
                ]
        ]);
    }

    public function update(Request $request ,UserType $membership){

        if($membership->id==1){

            abort(code:403);
        }

        $request->validate([
            'type' => ['required'],
            'discount' => ['required','integer'],
        ]);

        $membership->type= $request->type;
        $membership->discount= $request->discount;
        $membership->update();


        return Redirect::route('memberships.index')->with('message','Membership Updated');

    }

    public function destroy(UserType $Membership)
    {

        if($Membership->id==1){

            abort(code:403);
        }
        
        $Membership->delete();

        return Redirect::back()->with('message','Membership Deleted');
    }
}
