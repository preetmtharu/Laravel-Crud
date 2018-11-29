<?php

namespace App\Http\Controllers\Admin\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Model\admin\admin;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = 'admin/home';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest:admin')->except('logout');
    }

     public function showLoginForm()
    {
        
        return view('admin.login');
    }

    /**
     * Get the needed authorization credentials from the request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    protected function credentials(Request $request)
    {
        
        $admin = admin::where('email',$request->email)->first();

        if(count($admin)){
            
            if($admin->status == 0)
                {
                     return ['email'=>'Inactive','password'=>'You are not an active person, Please try contact admin'];

                }
                else
                {
                    return ['email'=>$request->email,'password'=>$request->password,'status'=>1];
                }
            }
        
    }

    public function login(Request $request)
    {
        $this->validateLogin($request);

       
        if ($this->attemptLogin($request)) {
            return $this->sendLoginResponse($request);
        }

        
        return $this->sendFailedLoginResponse($request);
    }

   /**
     * Log the user out of the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function logout(Request $request)
    {
        $this->guard()->logout();

        //$request->session()->invalidate();

        return redirect('/');
    }

     /**
     * Get the guard to be used during authentication.
     *
     * @return \Illuminate\Contracts\Auth\StatefulGuard
     */
    protected function guard()
    {
        return Auth::guard('admin');
    }

}
