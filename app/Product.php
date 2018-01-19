<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $_fillable = [
    	"name", "description", "image", "price", "category_id"
    ];
}
