import 'package:flutter/material.dart';
class Forget_Password extends StatefulWidget {
  const Forget_Password({super.key});

  @override
  State<Forget_Password> createState() => _Forget_PasswordState();
}

class _Forget_PasswordState extends State<Forget_Password> {

  TextEditingController _email = TextEditingController();

  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();

  bool _isLoading = false;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80, // Set this height
        titleSpacing: -6,
        backgroundColor: Colors.blueAccent.shade100,
        title: Text('Forget Password',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_sharp),

        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
                children: [
                  SizedBox(height: 25,),
                  Card(
                    color: Colors.white,
                    elevation: 2,
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Form(
                          key: _signUpFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Forget Password',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                              SizedBox(height: 10,),
                              Text('Enter your email address ',textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: Colors.grey),),
                              SizedBox(height: 20,),
                              TextFormField(
                                  controller: _email,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(7),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(7),

                                      ),
                                      hintText: 'Enter your email',

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
                              SizedBox(height: 25,),
                              InkWell(
                                onTap: (){
                                  if (_signUpFormKey.currentState?.validate() ?? false);
                                 // forgetpassword();
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.blue
                                  ),
                                  child: Center(child:_isLoading
                                      ? const CircularProgressIndicator(color: Colors.white)
                                      : Text('Send',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }
}
