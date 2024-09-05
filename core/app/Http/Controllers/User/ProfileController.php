<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Rules\FileTypeValidate;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;
use Illuminate\Validation\ValidationException;
use App\Models\User;
use Illuminate\Support\Facades\Validator;

class ProfileController extends Controller
{
    public function profile()
    {
        $pageTitle = "Profile Setting";
        $user = auth()->user();
        return view('Template::user.profile_setting', compact('pageTitle','user'));
    }

    public function profileApi($id)
    {
        $user = User::where('id', $id)->first();
        if ($user) {
            return response()->json([
                'status' => 'success',
                'data' => $user
            ], 200);
        }
        return response()->json([
            'status' => 'success',
            'message' => 'User not found'
        ], 401);
    }

    public function uploadProfilePicApi(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:users,id',
            'avatar'    => ['nullable', 'image', new FileTypeValidate(['jpg', 'jpeg', 'png'])]
        ], [
            'user_id.required' => 'The user ID is required.',
            'user_id.exists' => 'The user ID does not exist.'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors()
            ], 422);
        }

        $user = User::where('id', $request->user_id)->first();
        if (!$user) {
            return response()->json([
                'status' => 'success',
                'message' => 'User not found'
            ], 401);
        }

        @$old = $user->avatar;
        if ($request->has('avatar')) {
            try {
                $user->avatar = fileUploader($request->avatar, getFilePath('userProfile'), getFileSize('userProfile'), @$old);
                $user->save();
                return response()->json([
                    'status' => 'success',
                    'message' => $user
                ], 200);
            } catch (\Exception $exp) {
                throw ValidationException::withMessages(['error' => 'Couldn\'t upload your image']);
                return response()->json([
                    'status' => 'error',
                    'message' => 'Something went wrong'
                ], 404);
            }
        }
        return response()->json([
            'status' => 'error',
            'message' => 'Image not provided'
        ], 404);
    }

    public function submitProfile(Request $request)
    {
        $request->validate([
            'firstname' => 'required|string',
            'lastname' => 'required|string',
            'avatar'    => ['nullable', 'image', new FileTypeValidate(['jpg', 'jpeg', 'png'])]
        ],[
            'firstname.required'=>'The first name field is required',
            'lastname.required'=>'The last name field is required'
        ]);

        $user = auth()->user();

        @$old = $user->avatar;
        if ($request->has('avatar')) {
            try {
                $user->avatar = fileUploader($request->avatar, getFilePath('userProfile'), getFileSize('userProfile'), @$old);
            } catch (\Exception $exp) {
                throw ValidationException::withMessages(['error' => 'Couldn\'t upload your image']);
            }
        }

        $user->firstname = $request->firstname;
        $user->lastname = $request->lastname;

        $user->address = $request->address;
        $user->city = $request->city;
        $user->state = $request->state;
        $user->zip = $request->zip;

        $user->save();
        $notify[] = ['success', 'Profile updated successfully'];
        return back()->withNotify($notify);
    }

    public function changePassword()
    {
        $pageTitle = 'Change Password';
        return view('Template::user.password', compact('pageTitle'));
    }

    public function submitPassword(Request $request)
    {

        $passwordValidation = Password::min(6);
        if (gs('secure_password')) {
            $passwordValidation = $passwordValidation->mixedCase()->numbers()->symbols()->uncompromised();
        }

        $request->validate([
            'current_password' => 'required',
            'password' => ['required','confirmed',$passwordValidation]
        ]);

        $user = auth()->user();
        if (Hash::check($request->current_password, $user->password)) {
            $password = Hash::make($request->password);
            $user->password = $password;
            $user->save();
            $notify[] = ['success', 'Password changed successfully'];
            return back()->withNotify($notify);
        } else {
            $notify[] = ['error', 'The password doesn\'t match!'];
            return back()->withNotify($notify);
        }
    }

    public function changePasswordApi(Request $request)
    {
        $passwordValidation = Password::min(6)
            ->mixedCase()
            ->numbers()
            ->symbols()
            ->uncompromised();

        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:users,id',
            'current_password' => 'required',
            'password' => ['required', 'confirmed', $passwordValidation]
        ], [
            'user_id.required' => 'The user ID is required.',
            'user_id.exists' => 'The user ID does not exist.',
            'current_password.required' => 'The current password is required.',
            'password.required' => 'The new password is required.',
            'password.confirmed' => 'The password confirmation does not match.'
        ]);

        // Handle validation errors
        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'message' => $validator->errors()
            ], 422);
        }

        $user = User::where('id', $request->user_id)->first();
        if (!$user) {
            return response()->json([
                'status' => 'success',
                'message' => 'User not found'
            ], 401);
        }
        if (Hash::check($request->current_password, $user->password)) {
            $password = Hash::make($request->password);
            $user->password = $password;
            $user->save();
            return response()->json([
                'status' => 'success',
                'message' => 'Password changed successfully'
            ], 200);
        }

        return response()->json([
            'status' => 'success',
            'message' => 'Current password is wrong'
        ], 401);
    }

    public function updateProfileApi(Request $request)
    {
        $user = User::find($request->id);
        if (!$user) {
            return response()->json([
                'status' => 'error',
                'message' => 'User not found'
            ], 404);
        }
        // List of fields that can be updated
        $updatableFields = [
            'firstname',
            'lastname',
            'username',
            'email',
            'mobile',
            'country_name',
            'country_code',
            'city',
            'state',
            'zip',
            'address'
        ];

        // Loop through each updatable field
        foreach ($updatableFields as $field) {
            // If the request has this field, update the user's field
            if ($request->has($field)) {
                if ($request->email) {
                    $exist = User::where('email',$request->email)->exists();
                    if($exist) {
                        return response()->json([
                            'status' => 'error',
                            'message' => 'Email already exists'
                        ], 404);
                    }
                }
                if ($request->mobile) {
                    if (!$request->dial_code) {
                        return response()->json([
                            'status' => 'error',
                            'message' => 'Mobile code is require to change mobile number'
                        ], 404);
                    }
                    $exist = User::where('mobile',$request->mobile)->where('dial_code',$request->dial_code)->exists();
                    if($exist) {
                        return response()->json([
                            'status' => 'error',
                            'message' => 'Mobile already exists'
                        ], 404);
                    }
                }
                if ($request->username) {
                    $exist = User::where('username',$request->username)->exists();
                    if($exist) {
                        return response()->json([
                            'status' => 'error',
                            'message' => 'Username already exists'
                        ], 404);
                    }
                }
                if ($request->country_name) {
                    if (!$request->country_code) {
                        return response()->json([
                            'status' => 'error',
                            'message' => 'Country code is require to change country name'
                        ], 404);
                    }
                }
                $user->$field = $request->input($field);
            }
        }

        $user->save();

        return response()->json([
            'status' => 'success',
            'message' => 'Profile updated successfully',
            'data' => $user
        ], 200);
    }
}
