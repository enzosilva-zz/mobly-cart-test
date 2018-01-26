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
    	return $this->belongsTo(\App\Checkout::class);
    }

    public function product()
    {
        return $this->belongsTo(\App\Product::class);
    }

    public function getCartItems()
    {
        return $this->where("checkout_id", (new \App\Checkout)->getCurrentCheckoutId())
            ->get();
    }

    public function getItemsQty()
    {
    	return count($this->getCartItems());
    }
}
