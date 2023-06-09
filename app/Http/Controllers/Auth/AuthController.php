<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\BaseController as BaseController;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;

class AuthController extends BaseController
{
   /**
     * Register a user from the front end.
     *
     * @return \Illuminate\Contracts\View\View|\Illuminate\Contracts\View\Factory
     */
    public function register(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'firstName' => 'required',
                'lastName' => 'required',
                'email' => 'required|email',
                'password' => 'required',
                'confirmPassword' => 'required|same:password'
            ]);

            if($validator->fails()){
                return $this->sendError('Erreur.', $validator->errors());       
            }

            $existUser = User::where('email', $request->email)->get();

            if(count($existUser) > 0){
                return $this->sendError("User already exist", null, 422);
            }

            $data = array(
                "first_name" => $request->firstName,
                "last_name" => $request->lastName,
                "email" => $request->email,
                "status" => "pending",
                "password" => bcrypt($request->password)
            );
            if($request->phone){
                $data['phone'] = $request->phone;
            }
            if($request->address){
                $data['address'] = $request->address;
            }
            $input = $request->all();
            
            $user = User::create($data);
           
            $success['token'] =  $user->createToken('DaaraDjiFront')->plainTextToken;
            $success['name'] =  $user->name;
       
            return $this->sendResponse($success, 'User register successfully.');

        } catch (\Throwable $th) {
           return $this->sendError($th->getMessage(), $th->getTrace(), 400);
        }
        
       
    }

    /**
     * Process user login from front end.
     *
     * @return \Illuminate\Contracts\View\View|\Illuminate\Contracts\View\Factory
     */
    public function login(Request $request)
    {
        if(Auth::attempt(['email' => $request->email, 'password' => $request->password])){ 
            $user = Auth::user(); 
            $success['token'] =  $user->createToken('DaaraDjiFront')->plainTextToken; 
            $success['name'] =  $user->name;
   
            return $this->sendResponse($success, 'User login successfully.');
        } 
        else{ 
            return $this->sendError('Unauthorised.', ['error'=>'Unauthorised']);
        } 
       
    }

    /**
     * Request  a password recovery process.
     *
     * @param  String  $email
     * @return \Illuminate\Routing\Redirector|\Illuminate\Http\RedirectResponse
     */
    public function requestPasswordChange(Request $email)
    {
        
    }

}
