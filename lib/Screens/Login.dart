import 'package:flutter/material.dart';
import 'package:yubeo/Screens/%E2%80%8EForget_Password%E2%80%8E.dart';
import 'package:yubeo/Screens/SignUp.dart';

import '../Constants/AppColors.dart';
import 'Home1.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  TextStyle basicText = TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.w600,
      color: AppColors.blackColor);

  TextStyle smallText = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor);

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();

  bool passwordVisible=false;
  bool _isLoading = false; // Loading state variable

  @override
  void initState() {
    _email.clear();
    _password.clear();
    super.initState();
    passwordVisible=true;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
                 child: Form(
                   key: _signUpFormKey,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         SizedBox(height: 70,),
                       Center(child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.blue),)),
                        SizedBox(height: 25,),
                         TextFormField(
                             controller: _email,
                             decoration: InputDecoration(
                                 contentPadding: const EdgeInsets.all(7),
                                 border: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(7)
                                 ),
                                 hintText: "Enter your Email",
                               prefixIcon: Icon(Icons.attach_email)
                             ),
                             onSaved: (val) {
                               //  phone = val;
                             },
                             autovalidateMode: AutovalidateMode.onUserInteraction,
                             validator: (value) {
                               if (value == null || value.isEmpty) {
                                 return 'Please enter a email';
                               }
                               final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                               if (!emailRegex.hasMatch(value)) {
                                 return 'Please enter a valid email';
                               }
                               return null;
                             }
                         ),
                     SizedBox(height: 20,),
                     TextFormField(
                       controller: _password,
                       obscureText: passwordVisible,
                       decoration: InputDecoration(
                           contentPadding: const EdgeInsets.all(7),
                           border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(7)
                           ),
                           hintText: "Enter your Password",
                           prefixIcon: Icon(Icons.lock_outline),
                           suffixIcon: IconButton(
                             icon: Icon(passwordVisible
                                 ? Icons.visibility
                                 : Icons.visibility_off),
                             onPressed: () {
                               setState(
                                     () {
                                   passwordVisible = !passwordVisible;
                                 },
                               );
                             },
                           ),
                       ),
                       onSaved: (val) {
                         //  phone = val;
                       },
                       autovalidateMode: AutovalidateMode.onUserInteraction,
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return 'Please enter a password';
                         }
                         return null;
                       },
                     ),
                         SizedBox(
                           height: 15,
                         ),
                         InkWell(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context) => Forget_Password(),));
                           },
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               Text("Forget Password",style: TextStyle(color: Colors.grey),)
                             ],
                           ),
                         ),
                         const SizedBox(
                           height: 40,
                         ),
                         GestureDetector(
                           onTap: () {
                           //  if (_signUpFormKey.currentState?.validate() ?? false);
                               //login();
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Home1(),));
                           },
                           child: Container(
                             height: 50,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(16),
                                 color: Colors.blue
                             ),
                             child: Center(
                               child:_isLoading
                                   ? const CircularProgressIndicator(color: Colors.white)
                                   : const Text('Login', style: TextStyle(
                                   fontWeight: FontWeight.bold, color: Colors.white),),),
                           ),
                         ),
                         SizedBox(height: 30,),
                         Center(child: Text('Or continue with',style: TextStyle(color: Colors.grey),)),
                         SizedBox(height: 15,),
                         Center(
                           child: Image.network(
                             'http://pngimg.com/uploads/google/google_PNG19635.png',height: 80,width: 80,
                             fit: BoxFit.fitWidth,
                           ),
                         ),
                         SizedBox(height: 5,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text("Don`t have an account?",style: TextStyle(color: Colors.grey),),
                             InkWell(
                               onTap: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => Signup(),));
                               },
                                 child: Text(" Signup Now",style: TextStyle(color: Colors.blue,decoration: TextDecoration.underline),))
                           ],
                         )
                       ],
                     )),
          ),
        ),
      ),
    ));
  }
}
