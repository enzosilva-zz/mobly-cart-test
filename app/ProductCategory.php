<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductCategory extends Model
{
    protected $_fillable = [
    	"product_id", "category_id"
    ];
}
