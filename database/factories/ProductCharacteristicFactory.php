<?php

use Faker\Generator as Faker;

/** @var \Illuminate\Database\Eloquent\Factory $factory */
$factory->define(App\ProductCharacteristic::class, function (Faker $faker) use ($factory) {
    return [
        'product_id' => $factory->create(App\Product::class)->id,
        'characteristic_value_id' => $factory->create(App\CharacteristicValue::class)->id
    ];
});
