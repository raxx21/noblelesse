<?php

namespace App\Models;


use App\Traits\GlobalStatus;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\Attribute;

class TimeSetting extends Model
{
    use GlobalStatus;

    public function getTime(): Attribute
    {
        return new Attribute(
            get: fn () => $this->time . ' ' . $this->name,
        );
    }
}
