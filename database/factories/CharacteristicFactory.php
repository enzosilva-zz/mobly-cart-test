<?php

use Faker\Generator as Faker;

/** @var \Illuminate\Database\Eloquent\Factory $factory */
$factory->define(App\Characteristic::class, function (Faker $faker) {
    return [
        'name' => ucfirst($faker->word)
    ];
});
