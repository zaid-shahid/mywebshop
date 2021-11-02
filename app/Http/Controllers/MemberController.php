<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\UserType;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;

class MemberController extends Controller
{
    public function index(){


        $members = User::with('user_type')->whereHas(
            'user_type', function($q){
                $q->where('type','!=', 'admin');
            }
        )->get();


        return Inertia::render('admin/member/index',
         ['members' => $members]);
    
    }
    public function create(){

        $memberships= UserType::where('type','!=', 'admin')->get();

        return inertia::render('admin/member/create',['memberships'=>$memberships]);
    }

    public function store(Request $request)
    {

        $request->validate([
            'name' => ['required', 'min:4'],
            'email' => ['required', 'email'],
            'password' => ['required', 'min:4'],
        ]);

        $member= new User;

        $member->name = $request->name;
        $member->email = $request->email;
        $member->password = $request->password;
        $member->user_type_id =$request->type;

        $member->save();

        return Redirect::route('members.index')->with('message','User Created');
    }

    public function edit(User $Member){

        if($Member->id==1){

            abort(code:403);
        }


        $memberships= UserType::where('type','!=', 'admin')->get();

        return inertia::render('admin/member/edit', [
            'member' => [
                'id' => $Member->id,
                'name' => $Member->name,
                'email' => $Member->email,
                'password' => $Member->password,
                'membership' => $Member->user_type,
            ],
            'memberships'=>$memberships
        ]);
    }

    public function update(Request $request,User $member){

        if($member->id==1){

            abort(code:403);
        }

        $request->validate([
            'name' => ['required'],
            'email' => ['required', 'email'],
            'password' => ['required', 'min:4'],
        ]);

        $member->name = $request->name;
        $member->email = $request->email;
        $member->password = $request->password;
        $member->user_type_id =$request->membership_id;

        $member->update();

        return Redirect::route('members.index')->with('message','User Updated');

    }

    public function destroy(User $Member)
    {

        if($Member->id==1){

            abort(code:403);
        }

        $Member->delete();

        return Redirect::back()->with('message','User Deleted');
    }
}
