<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Actions\Fortify\PasswordValidationRules;
use App\Helpers\ResponseFormatter;
use App\Http\Requests\RegisterRequest;
use App\Models\User;
use Exception;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;


class UserController extends Controller
{
    use PasswordValidationRules;
    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \Exception
     */
    public function login(Request $request)
    {
        try {
            //validasi input
            $validator = Validator::make(
                $request->all(),
                [
                    'email' => ['required', 'email'],
                    'password' => ['required', 'string', 'min:8']
                ],
                [
                    'email' => 'example@gmail.com',
                    'email.required' => 'email tidak boleh kosong',
                    'password.min' => 'harus diisi dengan 8 karakter',
                    'password.required' => 'password tidak boleh kosong'
                ]
            );
            if ($validator->fails()){
                return response()->json([
                    'message' => $validator->errors()
                ],400);
            }
            // if ($validator->fails()) {
            //     return response()->json($validator->errors(), 400);
            // }

            //Mengecek Credentials (login)
            $credentials = request(['email', 'password']);
            // if (!Auth::attempt($credentials)) {
            //     return ResponseFormatter::error([
            //         'message' => 'Akun tidak terdaftar!'
            //     ], 'Authentication Failed', 500);
            // }
            if (!Auth::attempt($credentials)){
                return response()->json([
                    'message' => 'Akun tidak terdaftar!'
                ],500);
            }

            //Jika akun tidak sesuai berikan error
            $user = User::where('email', $request->email)->first();
            if (!Hash::check($request->password, $user->password, [])) {
                throw new \Exception('Invalid Credentials');
            }
            //jika akun berhasil
            $tokenResult = $user->createToken('authToken')->plainTextToken;
            return ResponseFormatter::success([
                'access_token' => $tokenResult,
                'token_type' => 'Bearer',
                'user' => $user
            ], 'Authenticated');
        } catch (Exception $error) {
            return ResponseFormatter::error([
                'message' => 'Something went wrong',
                'error' => $error
            ], 'Authenticated Failed', 500);
        }
    }
    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     * @throws \Exception
     */
    public function register(Request $request)
    {
        try {

            //Validasi Input
            $validator = Validator::make(
                $request->all(),
                // $request->validate(
                [
                    'name' => ['required', 'string', 'max:255'],
                    'email' => ['required', 'email', 'max:255', 'unique:users,email'],
                    'password' => ['required', 'string', 'min:8'],
                    'password_confirmation' => ['required', 'string', 'min:8', 'same:password'], //'confirmed' : menyamakan yang dibawah 'same:menyamakan yang diatas'
                    'phoneNumber' => ['required', 'numeric', 'unique:users,phoneNumber']
                    // 'password' => $this->passwordRules()
                ],
                [
                    'name.required' => 'nama tidak boleh kosong',
                    'email' => '@gmail.com',
                    'email.required' => 'email tidak boleh kosong',
                    'email.unique' => 'email sudah digunakan',
                    'password.required' => 'password tidak boleh kosong',
                    'password.min' => 'password minimal 8 Karakter',
                    'password_confirmation.required' => 'password confirmation tidak boleh kosong',
                    'password_confirmation.same' => 'password confirmation tidak sama',
                    'password_confirmation.min' => 'password minimal 8 Karakter',
                    'phoneNumber.required' => 'Nomor Telepon tidak boleh kosong',
                    'phoneNumber.numeric' => 'harus menggunakan angka',
                    'phoneNumber.unique' => 'nomor sudah digunakan'
                ]
            );

            if ($validator->fails()) {
                return response()->json([
                    'message' => $validator->errors()
                ], 400);
            }

            User::create([
                'name' => $request->name,
                'email' => $request->email,
                'address' => $request->address,
                'houseNumber' => $request->houseNumber,
                'phoneNumber' => $request->phoneNumber,
                'city' => $request->city,
                'password' => Hash::make($request->password),
            ]);

            $user = User::where('email', $request->email)->first();
            $tokenResult = $user->createToken('authToken')->plainTextToken;
            return ResponseFormatter::success([
                'access_token' => $tokenResult,
                'token_type' => 'Bearer',
                'user' => $user
            ], 'User Registered');
        } catch (Exception $error) {
            return ResponseFormatter::error([
                'message' => 'Something went error',
                'error' => $error,
            ], 'Authenticated Failed', 500);
        }
    }

    public function logout(Request $request)
    {
        $token = $request->user()->currentAccessToken()->delete();
        return ResponseFormatter::success([$token, 'Token Revoked']);
    }

    public function fetch(Request $request)
    {
        return ResponseFormatter::success($request->user(), 'Data User Berhasil diambil');
    }

    public function updateProfile(Request $request)
    {
        $data = $request->all();
        $user = Auth::user();
        $user = update($data);

        return ResponseFormatter::success($user, 'Profile Updated');
    }

    public function uploadPhoto(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'file' => 'required|image|max:2048'
        ]);
        if ($validator->fails()) {
            return ResponseFormatter::error(
                ['error' => $validator->errors()],
                'Update Photo Fails',
                401
            );
        }

        if ($request->file('file')) {
            $file = $request->file->store('assets/user', 'public');
            //Simpan ke Database
            $user = Auth::user();
            // dd($user); //untuk test preview
            $user = User::where('id', $user->id)->first(); //tambahan dari mas safi
            $user->profile_photo_path = $file;
            // $user = update();
            $user->save(); //tambahan dari mas safi


            return ResponseFormatter::success([$file], 'File Successfully Uploaded');
        }
    }
}
