<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\softDeletes;

class Transaction extends Model
{
    use HasFactory, softDeletes;

    protected $fillable = [
        'user_id', 'food_id', 'quantity',
        'total', 'status', 'payment_url'
    ];

    public function food()
    {
        return $this->hasOne(Food::class, 'id', 'food_id');
    }

    public function user()
    {
        return $this->hasOne(User::class, 'id', 'user_id');
    }

    public function getCreatedAtAttribute($value)
    {
        return Carbon::parse($value)->timestamp;
    }

    public function getUpdateAtAttribute($value)
    {
        return Carbon::parse($value)->timestamp;
    }

}
