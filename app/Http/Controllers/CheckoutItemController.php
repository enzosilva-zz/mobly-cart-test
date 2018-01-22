<?php

namespace App\Http\Controllers;

use App\CheckoutItem;
use Illuminate\Http\Request;

class CheckoutItemController extends Controller
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
     * @param  \App\CheckoutItem  $checkoutItem
     * @return \Illuminate\Http\Response
     */
    public function show(CheckoutItem $checkoutItem)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\CheckoutItem  $checkoutItem
     * @return \Illuminate\Http\Response
     */
    public function edit(CheckoutItem $checkoutItem)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\CheckoutItem  $checkoutItem
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, CheckoutItem $checkoutItem)
    {
    	$i = 0;
        foreach ($request->get("items") as $key => $item) {
        	$checkoutItem = \App\CheckoutItem::where("checkout_id", session()->get("checkout.checkout_id"))
                ->where("product_id", $key)
                ->first();

            $itemQty = ($item["item_qty"] - $checkoutItem["item_qty"]) + $checkoutItem["item_qty"];
            $checkoutItem->update([
                "item_qty" => $itemQty,
                "price" => ($itemQty * $item["item_price"])
            ]);

            if (session()->get("checkout.products.{$i}.product_id") == $key) {
                if (session()->has("checkout.products.{$i}.item_qty")) {
                    session()->put("checkout.products.{$i}.item_qty", $itemQty);
                }
            }

            $i++;
        }

        session()->flash("message", "Cart updated with success!");
        return back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\CheckoutItem  $checkoutItem
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, CheckoutItem $checkoutItem)
    {
    	$checkoutItem->where("checkout_id", session()->get("checkout.checkout_id"))
    		->where("product_id", $request->input("item_id"))
    		->delete();

    	foreach (session()->get("checkout.products") as $key => $product) {
            if ($product['product_id'] == $request->input('item_id')) {
                return session()->forget("checkout.products.{$key}");
            }
        }
    }
}
