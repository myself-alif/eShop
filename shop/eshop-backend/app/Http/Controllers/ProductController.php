<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;

class ProductController extends Controller
{
    public function show()
    {
        $products = [];


        $categories = Category::all();

        foreach ($categories as $category) {
            $productsOfTheCategory = Product::where("category_id", $category->id)->get();
            array_push($products, (object)[
                "name" => $category->title,
                "items" => $productsOfTheCategory
            ]);
        }




        return response([
            "products" => $products
        ]);
    }


    public function productsByCategory($category)
    {
        $products = Category::where("title", $category)->first()->product;

        return response([
            'products' => $products
        ]);
    }
}
