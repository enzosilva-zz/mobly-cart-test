<?php

namespace App\Http\Controllers;

use App\Checkout;
use Illuminate\Http\Request;

class CheckoutController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $itemsQty = (new \App\CheckoutItem)->getItemsQty();

        $results = \App\Checkout::where("user_id", auth()->user()->id)
            ->where("active", 0)
            ->simplePaginate(2);

        return view("my_checkouts")
            ->with("results", $results)
            ->with("itemsQty", $itemsQty);
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Checkout  $checkout
     * @return \Illuminate\Http\Response
     */
    public function show(Checkout $checkout)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Checkout  $checkout
     * @return \Illuminate\Http\Response
     */
    public function edit(Checkout $checkout)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Checkout  $checkout
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Checkout $checkout)
    {
        if (!\Auth::check()) {
            session()->flash("message", "Do the login first, please!");
            session()->put("url", "/checkout/item");
            return redirect("/login");
        }

        $checkout::where("id", (new \App\Checkout)->getCurrentCheckoutId())
            ->update([
                "user_id" => auth()->user()->id,
                "active" => $request->input("active")
            ]);

        session()->flash("message", "Checkout made successfully!");

        session()->forget("checkout");
        return redirect("/");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Checkout  $checkout
     * @return \Illuminate\Http\Response
     */
    public function destroy(Checkout $checkout)
    {
        //
    }
}
