<?php

use Faker\Generator as Faker;

/** @var \Illuminate\Database\Eloquent\Factory $factory */
$factory->define(App\Product::class, function (Faker $faker) use ($factory) {
    return [
        'name' => ucfirst($faker->word),
        'description' => $faker->text(100),
        'price' => $faker->randomFloat(2, 0, 100),
        'category_id' => $factory->create(App\Category::class)->id
    ];
});
