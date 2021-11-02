<?php

namespace App\Http\Controllers;

use App\Models\Payment;
use Illuminate\Http\Request;
use Inertia\Inertia;

class PaymentController extends Controller
{
    public function show($id){

        $payment=Payment::find($id);

        return Inertia::render('admin/order/PaymentDetail',['payment'=>$payment]);
    }
}
