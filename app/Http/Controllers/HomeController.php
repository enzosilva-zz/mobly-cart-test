<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (!session()->has("checkout")) {
            $checkout = \App\Checkout::create([
                "user_id" => (isset(auth()->user()->id)) ? auth()->user()->id : null
            ]);

            session(['checkout' => ['checkout_id' => $checkout->id]]);
        }

        $checkoutItems = \App\CheckoutItem::where("checkout_id", (new \App\Checkout)->getCurrentCheckoutId())
            ->get();

        $itemsQty = 0;
        $itemsPrice = 0;
        foreach ($checkoutItems as $checkoutItem) {
            $itemsQty += $checkoutItem->item_qty;
            $itemsPrice += $checkoutItem->price;
        }

        \App\Checkout::where("id", (new \App\Checkout)->getCurrentCheckoutId())
            ->update([
                "items_qty" => $itemsQty,
                "subtotal" => $itemsPrice,
                "total" => $itemsPrice,
            ]);

        $products = \App\Product::orderBy('id', 'desc')
            ->limit(4)
            ->get();

        $itemsQty = (new \App\CheckoutItem)->getItemsQty();

        return view("home")
            ->with("products", $products)
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
