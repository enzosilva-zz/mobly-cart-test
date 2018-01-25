<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Checkout extends Model
{
	protected $table = "checkout";

	protected $fillable = ["user_id"];

    public function user()
    {
    	return $this->belongsTo(\App\User::class);
    }

    public function checkoutItem()
    {
    	return $this->hasMany(\App\CheckoutItem::class);
    }

    public function updateCurrentCheckoutData()
    {
        $checkoutItems = \App\CheckoutItem::where("checkout_id", session()->get("checkout.checkout_id"))
            ->get();

        $itemsQty = 0;
        $itemsPrice = 0;
        foreach ($checkoutItems as $checkoutItem) {
            $itemsQty += $checkoutItem->item_qty;
            $itemsPrice += $checkoutItem->price;
        }

        return \App\Checkout::where("id", session()->get("checkout.checkout_id"))
            ->update([
                "items_qty" => $itemsQty,
                "subtotal" => $itemsPrice,
                "total" => $itemsPrice,
            ]);
    }
}
