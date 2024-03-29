<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Storage;

class Food extends Model
{
    use HasFactory;
    // , SoftDeletes; untuk hapus tapi DB tidak tgerhapus

    protected $fillable = [
        'picturePath', 'name', 'description', 'ingredients', 'price', 'rate', 'types_id'
    ];

    public function types()
    {
        return $this->belongsTo(Types::class, 'types_id', 'id');
    }

    public function toArray()
    {
        $toArray = parent::toArray();
        $toArray['picturePath'] = $this->pictureFile;
        return $toArray;
    }

    public function getCreatedAtAttribute($created_at)
    {
        return Carbon::parse($created_at)
            ->getPreciseTimestamp(3);
    }
    public function getUpdatedAtAttribute($updated_at)
    {
        return Carbon::parse($updated_at)
            ->getPreciseTimestamp(3);
    }

    public function getPictureFileAttribute()
    {
        return url('') . Storage::url($this->attributes['picturePath']);
    }
}
