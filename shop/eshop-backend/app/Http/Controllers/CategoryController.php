<?php

namespace App\Http\Controllers;

use App\Models\Category;


class CategoryController extends Controller
{
    public function show()
    {
        return response([
            "categories" => Category::all()
        ]);
    }
}
