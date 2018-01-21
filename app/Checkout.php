<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Checkout extends Model
{
	protected $table = "checkout";

    public function user()
    {
    	return $this->belongsTo(\App\User::class);
    }
}
