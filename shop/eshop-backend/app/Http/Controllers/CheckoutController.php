<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CheckoutController extends Controller
{
    public function removeItem(Request $request)
    {
        Cart::where('product_title', $request->product_title)->delete();
        return response([
            'cartItems' => Auth::user()->cart
        ]);
    }

    public function increseItem(Request $request)
    {


        $item = Cart::where('product_title', $request->product_title)->first();
        $item->product_quantity = $request->product_quantity + 1;
        $item->save();

        return response([
            "cartItems" => Auth::user()->cart
        ]);
    }

    public function dicreseItem(Request $request)
    {
        $item = Cart::where("product_title", $request->product_title)->first();
        if ($item->product_quantity == 1) {
            $item->delete();
        } else {
            $item->product_quantity = $request->product_quantity - 1;
            $item->save();
        }
        return response([
            "cartItems" => Auth::user()->cart
        ]);
    }
}
