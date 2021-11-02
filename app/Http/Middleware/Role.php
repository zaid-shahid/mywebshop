<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class Role
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next, string $role)
    {

        if($role=='admin' && Auth::user()->user_type_id==1){


            return $next($request);

        }
        if($role=='user' && Auth::user()->user_type_id!==1){

            return $next($request);

        }

        abort(code:403);

        
    }
}
