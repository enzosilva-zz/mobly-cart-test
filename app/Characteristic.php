<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Characteristic extends Model
{
	public function product()
	{
		return $this->belongsTo(\App\Product::class);
	}

    public function characteristicValue()
    {
    	return $this->hasMany(\App\CharacteristicValue::class);
    }
}
