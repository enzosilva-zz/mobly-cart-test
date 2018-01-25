<?php

use Faker\Generator as Faker;

/** @var \Illuminate\Database\Eloquent\Factory $factory */
$factory->define(App\ProductCategory::class, function (Faker $faker) use ($factory) {
    return [
        'product_id' => $factory->create(App\Product::class)->id,
        'category_id' => $factory->create(App\Category::class)->id
    ];
});
