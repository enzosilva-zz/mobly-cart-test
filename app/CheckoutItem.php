<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CheckoutItem extends Model
{
	/**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'checkout_id', 'product_id', 'name', 'item_qty', 'price'
    ];

    public function checkout()
    {
    	return $this->belongsTo(\Checkout::class);
    }

    public function getItemsQty()
    {
    	return $this->where("checkout_id", session()->get("checkout.checkout_id"))
    		->count();
    }
}
