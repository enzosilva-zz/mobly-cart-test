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

    public function getCurrentCheckoutId()
    {
        $checkoutId = session()->get("checkout.checkout_id");

        $userIsLoggedIn = \Auth::check();
        if ($userIsLoggedIn) {
            $currentCheckout = \App\Checkout::where("user_id", auth()->user()->id)
                ->where("active", 1)
                ->orderBy("id", "desc")
                ->first(["id"]);

            if (count($currentCheckout)) {
                $checkoutId = $currentCheckout->id;
            }
        }

        return $checkoutId;
    }

    public function updateCurrentCheckoutData()
    {
        $checkoutItems = \App\CheckoutItem::where("checkout_id", $this->getCurrentCheckoutId())
            ->get();

        $itemsQty = 0;
        $itemsPrice = 0;
        foreach ($checkoutItems as $checkoutItem) {
            $itemsQty += $checkoutItem->item_qty;
            $itemsPrice += $checkoutItem->price;
        }

        return \App\Checkout::where("id", $this->getCurrentCheckoutId())
            ->update([
                "items_qty" => $itemsQty,
                "subtotal" => $itemsPrice,
                "total" => $itemsPrice,
            ]);
    }
}
