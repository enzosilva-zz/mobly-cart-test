<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
	protected $_fillable = [
    	"name"
    ];

    public function product()
    {
    	return $this->belongsToMany(\App\Product::class, "product_categories");
    }
}
