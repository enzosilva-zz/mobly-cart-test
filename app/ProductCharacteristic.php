<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductCharacteristic extends Model
{
    protected $_fillable = [
    	"product_id", "characteristic_id"
    ];

    public function product()
	{
		return $this->belongsTo(\App\Product::class);
	}

	public function characteristicValue()
	{
		return $this->belongsTo(\App\CharacteristicValue::class);
	}
}
