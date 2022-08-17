<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\softDeletes;
use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;

class Food extends Model
{
    use 
    HasFactory ;
    //Softdeletes untuk tidak hapus permanent
    // softDeletes;

    protected $fillable = [
        'name', 'description', 'ingredients',
        'price', 'rate', 'types',
        'picturePath'
    ];

    public function getCreatedAtAttribute($value)
    {
        return Carbon::parse($value)->timestamp;
    }
    
    public function getUpdateAtAttribute($value)
    {
        return Carbon::parse($value)->timestamp;
    }

    public function toArray()
    {
        $toArray = parent::toArray();
        $toArray['picturePath'] = $this->picturePath;
        return $toArray;
    }

    public function getPictureFileAttribute()
    {
        return url('') . Storage::url($this->attributes['picturePath']);
    }
}
