<?php

namespace App\Http\Responses;

use Laravel\Fortify\Contracts\LoginResponse as ContractsLoginResponse;

class LoginResponse implements ContractsLoginResponse
{
    public function toResponse($request)
    {
        
        if (auth()->user()->user_type_id == 1) {
            return redirect()->intended(route('dashboard.admin'));
        }

        return redirect()->intended(route('dashboard'));
    }
}