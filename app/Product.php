<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $_fillable = [
    	"name", "description", "image", "price"
    ];

    public function category()
    {
        return $this->belongsToMany(\App\Category::class, "product_categories");
    }

    public function characteristic()
    {
        return $this->belongsToMany(\App\Characteristic::class, "product_characteristics");
    }
}
