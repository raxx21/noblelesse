<?php

namespace App\Http\Controllers\User\Auth;

use App\Http\Controllers\Controller;
use App\Models\PasswordReset;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class ForgotPasswordController extends Controller
{
    public function showLinkRequestForm()
    {
        $pageTitle = "Account Recovery";
        return view('Template::user.auth.passwords.email', compact('pageTitle'));
    }

    public function sendResetCodeEmail(Request $request)
    {
        $request->validate([
            'value' => 'required'
        ]);

        if (!verifyCaptcha()) {
            $notify[] = ['error', 'Invalid captcha provided'];
            return back()->withNotify($notify);
        }

        $fieldType = $this->findFieldType();
        $user = User::where($fieldType, $request->value)->first();

        if (!$user) {
            $notify[] = ['error', 'The account could not be found'];
            return back()->withNotify($notify);
        }

        PasswordReset::where('email', $user->email)->delete();
        $code = verificationCode(6);
        $password = new PasswordReset();
        $password->email = $user->email;
        $password->token = $code;
        $password->created_at = \Carbon\Carbon::now();
        $password->save();

        $userIpInfo = getIpInfo();
        $userBrowserInfo = osBrowser();
        notify($user, 'PASS_RESET_CODE', [
            'code' => $code,
            'operating_system' => @$userBrowserInfo['os_platform'],
            'browser' => @$userBrowserInfo['browser'],
            'ip' => @$userIpInfo['ip'],
            'time' => @$userIpInfo['time']
        ], ['email']);

        $email = $user->email;
        session()->put('pass_res_mail', $email);
        $notify[] = ['success', 'Password reset email sent successfully'];
        return to_route('user.password.code.verify')->withNotify($notify);
    }

    public function sendResetCodeEmailApi(Request $request)
    {
        // Validate the input
        $validator = Validator::make($request->all(), [
            'email' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'errors' => $validator->errors()
            ], 422);
        }

        // Check captcha
        if (!verifyCaptcha()) {
            return response()->json([
                'status' => 'error',
                'message' => 'Invalid captcha provided'
            ], 422);
        }

        // Determine the field type (email or username)
        // $fieldType = $this->findFieldType();
        $user = User::where('email', $request->email)->first();

        // If the user is not found
        if (!$user) {
            return response()->json([
                'status' => 'error',
                'message' => 'The account could not be found'
            ], 404);
        }

        // Delete any existing password reset tokens
        PasswordReset::where('email', $user->email)->delete();

        // Generate a new reset code
        $code = verificationCode(6);

        // Create a new password reset entry
        $passwordReset = new PasswordReset();
        $passwordReset->email = $user->email;
        $passwordReset->token = $code;
        $passwordReset->created_at = \Carbon\Carbon::now();
        $passwordReset->save();

        // Gather user IP and browser info
        // $userIpInfo = getIpInfo();
        // $userBrowserInfo = osBrowser();

        // // Notify the user
        // notify($user, 'PASS_RESET_CODE', [
        //     'code' => $code,
        //     'operating_system' => @$userBrowserInfo['os_platform'],
        //     'browser' => @$userBrowserInfo['browser'],
        //     'ip' => @$userIpInfo['ip'],
        //     'time' => @$userIpInfo['time']
        // ], ['email']);

        // // Save the email in the session
        // session()->put('pass_res_mail', $user->email);

        // Return a success response
        return response()->json([
            'status' => 'success',
            'message' => 'Password reset email sent successfully',
            'email' => $user->email
        ], 200);
    }


    public function findFieldType()
    {
        $input = request()->input('value');

        $fieldType = filter_var($input, FILTER_VALIDATE_EMAIL) ? 'email' : 'username';
        request()->merge([$fieldType => $input]);
        return $fieldType;
    }

    public function codeVerify(Request $request)
    {
        $pageTitle = 'Verify Email';
        $email = $request->session()->get('pass_res_mail');
        if (!$email) {
            $notify[] = ['error', 'Oops! session expired'];
            return to_route('user.password.request')->withNotify($notify);
        }
        return view('Template::user.auth.passwords.code_verify', compact('pageTitle', 'email'));
    }

    public function verifyCode(Request $request)
    {
        $request->validate([
            'code' => 'required',
            'email' => 'required'
        ]);
        $code =  str_replace(' ', '', $request->code);

        if (PasswordReset::where('token', $code)->where('email', $request->email)->count() != 1) {
            $notify[] = ['error', 'Verification code doesn\'t match'];
            return to_route('user.password.request')->withNotify($notify);
        }
        $notify[] = ['success', 'You can change your password'];
        session()->flash('fpass_email', $request->email);
        return to_route('user.password.reset', $code)->withNotify($notify);
    }

    public function verifyCodeApi(Request $request)
    {
        // Validate the input
        $validator = Validator::make($request->all(), [
            'code' => 'required',
            'email' => 'required|email'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 'error',
                'errors' => $validator->errors()
            ], 422);
        }

        // Check if the provided code matches the one in the database
        $passwordReset = PasswordReset::where('token', $request->code)->where('email', $request->email)->first();

        if (!$passwordReset) {
            return response()->json([
                'status' => 'error',
                'message' => 'Verification code doesn\'t match'
            ], 404);
        }

        return response()->json([
            'status' => 'success',
            'message' => 'You can change your password',
        ], 200);
    }

}
