<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Cart;

class CartController extends Controller
{
    public function addToCart(Request $request)
    {
        $user = Auth::user();

        $checkIfProductExtists = Cart::where("product_title", $request->product_title)->first();
        if (!$checkIfProductExtists) {
            $productToAdd = new Cart();
            $productToAdd->product_image = $request->product_image;
            $productToAdd->product_title = $request->product_title;
            $productToAdd->product_price = $request->product_price;
            $productToAdd->product_quantity = $request->product_quantity;
            $user->cart()->save($productToAdd);


            $cartItems = Cart::where('user_id', $user->id)->count();
            return response([
                'itemsCount' => $cartItems
            ]);
        } else {
            $checkIfProductExtists->product_quantity = $checkIfProductExtists->product_quantity + 1;
            $checkIfProductExtists->save();

            $cartItems = Cart::where('user_id', $user->id)->count();
            return response([
                'itemsCount' => $cartItems,
                "cartItems" => Auth::user()->cart
            ]);
        }

        return response([
            $cartItems = Cart::where('user_id', $user->id)->count(),
            'itemsCount' => $cartItems

        ]);
    }


    public function viewCart()
    {
        $userId = Auth::user()->id;

        $cartItems = Cart::where('user_id', $userId)->get();

        return response([
            'items' => $cartItems
        ]);
    }

    public function cartItemCount()
    {
        $userId = Auth::user()->id;
        $cartItems = Cart::where('user_id', $userId)->count();
        return response([
            'itemsCount' => $cartItems
        ]);
    }
}
