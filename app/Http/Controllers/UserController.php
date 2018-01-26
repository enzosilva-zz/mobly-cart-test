<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
    	$itemsQty = (new \App\CheckoutItem)->getItemsQty();

        return view("user_create")
        	->with("itemsQty", $itemsQty);
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
            "name" => "required",
            "email" => "required|email",
            "password" => "required"
        ]);

        $user = \App\User::create($request->all());

        if ($user) {
        	\Auth::loginUsingId($user->id);

        	$checkout = \App\Checkout::where("id", (new \App\Checkout)->getCurrentCheckoutId())
	            ->where("active", 1)
	            ->orderBy("id", "desc")
	            ->first();

	        if (!$checkout->user_id) {
	            \App\Checkout::where("id", session()->get("checkout.checkout_id"))
	                ->update(["user_id" => auth()->user()->id]);
	        }
	        
        	session()->flash("message", "Registered successfully!");
        	return redirect("/");
        }

        session()->flash("message", "Could not register!");
        return redirect("/");
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
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
