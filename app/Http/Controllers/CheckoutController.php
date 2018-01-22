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

        if (!$itemsQty) {
            return redirect("/");
        }

        $cartItems = (new \App\CheckoutItem)->getCartItems();

        return view("checkout")
            ->with("cartItems", $cartItems)
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
        if (session()->has('checkout.products')) {
            foreach (session()->get('checkout.products') as $key => $product) {
                if ($product['product_id'] == $request->input('product_id')) {
                    if (session()->has("checkout.products.{$key}.item_qty")) {
                        session()->put("checkout.products.{$key}.item_qty", ($product['item_qty'] + $request->input('item_qty')));

                        $checkoutItem = \App\CheckoutItem::where("checkout_id", session()->get("checkout.checkout_id"))
                            ->where("product_id", $request->input("product_id"))
                            ->first();

                        return $this->update($request, $checkoutItem);
                    }

                    continue;
                }
            }
        }

        session()->push('checkout.products', $request->only(['product_id', 'name', 'price', 'item_qty']));
        \App\CheckoutItem::create([
            "checkout_id" => session()->get("checkout.checkout_id"),
            "product_id" => $request->input("product_id"),
            "name" => $request->input("name"),
            "item_qty" => $request->input("item_qty"),
            "price" => $request->input("item_qty") * $request->input("price")
        ]);

        session()->flash("message", "Product added with success!");
        return back();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Checkout  $checkout
     * @return \Illuminate\Http\Response
     */
    public function show(Checkout $checkout)
    {
        dd(session());
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
    public function update(Request $request, \App\CheckoutItem $checkoutItem)
    {
        $checkoutItem->update([
            "item_qty" => ($checkoutItem["item_qty"] + $request->input('item_qty')),
            "price" => (($checkoutItem["item_qty"] + $request->input('item_qty')) * $request->input("price"))
        ]);

        session()->flash("message", "Product added with success!");
        return back();
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
