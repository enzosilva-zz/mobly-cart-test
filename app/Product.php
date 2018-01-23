<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $_fillable = [
    	"name", "description", "image", "price", "category_id"
    ];

    public function category()
    {
        return $this->belongsTo(\App\Category::class);
    }

    public function characteristics()
    {
    	return $this->hasMany(\App\Characteristic::class);
    }
}
