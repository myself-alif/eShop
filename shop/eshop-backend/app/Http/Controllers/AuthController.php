<?php

namespace App\Http\Controllers;

use Laravel\Socialite\Facades\Socialite;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function redirect()
    {
        return response([
            'url' => Socialite::with('google')->stateless()->redirect()->getTargetUrl()
        ]);
    }

    public function callback()
    {
        $user = Socialite::with('google')->stateless()->user();
        $googleUser = User::updateOrCreate(
            ['email' => $user->email],
            ['name' => $user->name, 'google_id' => $user->id]
        );
        $token = $googleUser->createToken($googleUser->email)->plainTextToken;

        Auth::login($googleUser);

        return response([
            'token' => $token,
            'url' => 'http://localhost:3000',
        ]);
    }

    public function logout()
    {
        if (Auth::check()) {

            $tokens = DB::table('personal_access_tokens')->where('name', Auth::user()->email)->get();
            foreach ($tokens as $token) {
                DB::table('personal_access_tokens')->where('token', $token->token)->delete();
            }
            return response([
                'url' => "http://localhost:3000/"
            ]);
        }
    }

    public function signUpWithEmailAndPassword(Request $request)
    {
        $checkIfUserExists = User::where('email', $request->email)->first();
        if ($checkIfUserExists) {
            return response([
                'message' => "Email Already registered."
            ]);
        }

        if ($request->password == $request->confirmPassword) {
            $user = user::create([
                'name' => $request->displayName,
                'email' => $request->email,
                'password' => Hash::make($request->password)
            ]);

            $token = $user->createToken($user->email)->plainTextToken;

            return response([
                'message' => "User Registered",
                'token' => $token,
                'url' => 'http://localhost:3000'
            ]);
        } else {
            return response([
                'message' => "Password fields didn't match"
            ]);
        }
    }


    public function signInWithEmailAndPassword(Request $request)
    {

        $checkIfUserExists = User::where("email", $request->email)->first();
        if ($checkIfUserExists && Hash::check($request->password, $checkIfUserExists->password)) {
            $token = $checkIfUserExists->createToken($checkIfUserExists->email)->plainTextToken;
            return response([

                'token' => $token,
                'url' => 'http://localhost:3000'
            ]);
        } else {
            return response([
                'message' => 'Invalid Email/Password'
            ]);
        }
    }
}
