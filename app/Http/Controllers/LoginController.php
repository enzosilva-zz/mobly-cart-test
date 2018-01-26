<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view("login")
            ->with("itemsQty", 10);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            "email" => "required|email",
            "password" => "required"
        ]);

        $auth = Auth::attempt([
            "email" => $request->input("email"),
            "password" => $request->input("password")
        ]);

        if (!$auth) {
            session()->flash("message", "Invalid email or password!");
            return back();
        }

        $checkout = \App\Checkout::where("id", (new \App\Checkout)->getCurrentCheckoutId())
            ->where("active", 1)
            ->orderBy("id", "desc")
            ->first();

        if (!$checkout->user_id) {
            \App\Checkout::where("id", session()->get("checkout.checkout_id"))
                ->update(["user_id" => auth()->user()->id]);
        }

        session()->put("checkout.user_id", auth()->user()->id);
        session()->flash("message", "Logged in with success!");

        if (session()->has("url")) {
            return redirect(session()->get("url"));
        }

        return redirect('/');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function destroy()
    {
        auth()->logout();
        session()->flush();
        session()->flash("message", "Logged out with success!");

        return redirect("/");
    }
}
