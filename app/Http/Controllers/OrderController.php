<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Payment;
use DateTime;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;


class OrderController extends Controller
{
    public function index(){

        $orders = Order::with('user','payment')->get();

        return Inertia::render('admin/order/index', ['orders' => $orders]);
    
    }

    public function store(Request $request){


        $request->validate([
            'carts' => ['required'],
            'amount' => ['required'],
            'payment_method' => ['required'],
            'name_on_card' => ['required'],
            'card_no' => ['required'],
            'card_expiration' => ['required'],
            'c_v_v' => ['required','min:3'],
        ]);

        //__________________ payment save ______________________________

        $payment= new Payment;

        $payment->payment_method=$request->payment_method;
        $payment->name_on_card= $request->name_on_card;
        $payment->card_no =$request->card_no;
        $payment->card_expiration =$request->card_expiration;
        $payment->c_v_v =$request->c_v_v;

        $payment->save();

        //__________________ Order save ______________________________

        $payment_id=$payment->id;

        $carts=$request->carts;

        $amount=$request->amount;

        $Order = new Order;

        $Order->totalProducts= count($carts);

        $Order->totalAmount = $amount;

        $Order->user_id = Auth::user()->id;

        $Order->payment_id= $payment_id;

        $Order->save();


        //__________________ Order Detail save ______________________________


        $order_id=$Order->id;


        foreach($carts as  $cart ){

            $orderDetail= new OrderDetail;

            $orderDetail->order_id=$order_id;
            $orderDetail->product_id=$cart['product_id'];
            $orderDetail->itemQuantity=$cart['quantity'];

            $orderDetail->save();

        }

            Cart::truncate();
        

        return Redirect::route('home')
        
        ->with('message','Order Submitted Successfully Your Order Tracking Id is '.$order_id);

    }

    public function destroy($order_id)
    {

        $order=Order::find($order_id);

        if($order->order_details()->delete()){

        $order->delete();
        }

        return Redirect::back()->with('message','Order Deleted');
    }

    public function update($id){

        $order=Order::find($id);

        if($order->orderStatus==="Shipped"){

            return Redirect::back()->with('message','Already Shipped');

        }

        date_default_timezone_set('Asia/Karachi');

        $order->shipDate= date("Y-m-d H:i:s");;

        $order->orderStatus= "Shipped";

        $order->update();

        return Redirect::back()->with('message','Order Status Updated');

    }

}
