
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;



enum authenticationMode{singIn,singUp}

class Auth extends GetxController{
  bool passwordInVisible = true;
  

 
  bool isLoading=false;
  //  define auth NMode Variable
  authenticationMode authMode=authenticationMode.singIn;
  //:::::::::::::::::::::
  var authmodeSingIn=authenticationMode.singIn;
  var authmodeSinUp=authenticationMode.singIn;
  //:::::::::::::::::::::Change Abscure Password Icon::::::::::::::::::::::::
  changeAbscureIcon()
   {
     passwordInVisible= !passwordInVisible;

   }
  // ::::::::Change to True::::::::::::::::
  changeStateToTrue()
  {
    isLoading=true;
    update();
  }
  // ::::::::Change to false::::::::::::::::
  changeStateToFlase()
  {
    isLoading=true;
    update();
  }

  //::::::::::::::::::::::::Switch Authentication Mode:::::::::::::::::::::::::::::::::
  void switchAuthenticatinMode()
  {
    if(authMode==authenticationMode.singIn)
    {
      authMode=authenticationMode.singUp;
      update();
    }
    else{
       authMode=authenticationMode.singIn;
    }

  }

// ::::::::::::::::::::::::::::::::Authentication Method::::::::::::::::::::::
  Future<void> authentication(String email,String password,String urlsegement)
  async{
    final url = 'https://identitytoolkit.googleapis.com/v1/accounts:$urlsegement?key=AIzaSyCtljSwJoSWtqpVCgK6qL9sU10gH8fA6R4';
    
    try{
       final response=await http.post(Uri.parse(url),body:json.encode({
           'email':email,
           'password':password,
           'returnSecureToken':true,
       }));
 
    }
    catch(error)
    {
       rethrow;
    }



  }
// ::::::::::::::::::::::::::::::::::Sing in Method::::::::::::::::::::::::::::::::
   Future<void> singIn(String email,String password,String? urlSegment) async{
   authentication( email, password, 'signInWithPassword');
   } 
// ::::::::::::::::::::::::::::::::::Sing Up Method::::::::::::::::::::::::::::::::

   Future<void> singUn(String email,String password,String? urlSegment) async{
   authentication( email, password, 'signUp');
   } 


}