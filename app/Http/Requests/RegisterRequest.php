<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RegisterRequest extends FormRequest
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

    public function messages()
    {
        return [
            'name.required' => 'nama tidak boleh kosong.',
            'email.required' => 'email tidak boleh kosong.',
            'password.required' => 'password minimal 8 karakter.',
            'password_confirmation.required' => 'password tidak sama.',
            'phoneNumber.required' => 'tidak boleh kososng',
        ];
    }


    public function rules()
    {
        return [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email', 'max:255', 'unique:users,email'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'password_confirmation' => ['required', 'string', 'min:8'],
            'phoneNumber' => ['required', 'numeric', 'unique:users,phoneNumber']
        ];
    }
}
