<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class FoodRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'required|max:255',
            'description' => 'required',
            'ingredients' => 'required',
            'price' => 'required|integer',
            'rate' => 'required|numeric|max:5',
            'types_id' => 'required|in:1, 2, 3',
            'picturePath' => 'required|image'
        ];
    }
    public function messages()
    {
        return 
        [
            'types_id.required' => 'Silahkan Pilih Type'
        ];
    }
}
