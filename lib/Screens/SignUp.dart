import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:yubeo/Screens/Location.dart';

import 'Login.dart';
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  var isLength = 0;

  bool check = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_outlined,size: 30,color: Colors.black,)),
      automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Form(
              key: _signUpFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Center(child: Text("Create an account",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blue),)),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                   // controller: _name,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        hintText: "Enter your name",
                      prefixIcon: Icon(Icons.account_circle_outlined)
                    ),
                    onSaved: (val) {
                      //  phone = val;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                   // controller: _lastname,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        hintText: "Enter last name",
                        prefixIcon: Icon(Icons.account_circle_outlined)
                    ),
                    onSaved: (val) {
                      //  phone = val;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a last name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                     // controller: _email,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(7),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7)
                          ),
                          hintText: "Enter Email",
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
                  SizedBox(
                    height: 15,
                  ),
                  IntlPhoneField(
                    //controller: controller,
                    flagsButtonPadding: const EdgeInsets.all(4),
                    dropdownIconPosition: IconPosition.trailing,
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      counterText: "",
                      contentPadding: const EdgeInsets.all(7),
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      setState(() {
                        isLength = phone.number.length;
                        print(phone.completeNumber);
                      });
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    // controller: _number,
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(7),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7)
                      ),
                      hintText: "Select Location",
                      prefixIcon: Icon(Icons.location_on_outlined),
                      suffixIcon: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Location(),));
                        },
                          child: Icon(Icons.arrow_forward_ios))
                    ),
                    keyboardType: TextInputType.phone,
                    onSaved: (val) {
                      //  phone = val;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                   // controller: _password,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        hintText: "Enter Password",
                        prefixIcon: Icon(Icons.lock_outline)
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
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    //controller: _cpassword,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        hintText: "Enter Confirm Password",
                        prefixIcon: Icon(Icons.lock_outline)
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            check = !check;
                          });
                        },
                        child: check
                            ? Icon(Icons.check_box, color: Colors.blue)
                            : Icon(Icons.check_box_outline_blank,),
                      ),
                      Text("I have read the"),
                      Text(" Terms & Conditions",style: TextStyle(color: Colors.blue),),
                     // Text(" and accept them")
                    ],
                  ),

                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_signUpFormKey.currentState?.validate() ?? false);
                       // register();
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.blue
                      ),
                      child: Center(child: Text('Register', style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),),),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?', style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),),
                      InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Login(),));
                          },
                          child: Text('Login Now', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,decoration: TextDecoration.underline),))
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
        );
  }

}
