import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
class My_Profile extends StatefulWidget {
  const My_Profile({super.key});

  @override
  State<My_Profile> createState() => _My_ProfileState();
}

class _My_ProfileState extends State<My_Profile> {

  File? _image;

  void _showPicker(BuildContext context, int imageNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose an Image'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('Gallery'),
                  onTap: () {
                    _getImage(ImageSource.gallery, imageNumber);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: () {
                    _getImage(ImageSource.camera, imageNumber);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  Future<void> _getImage(ImageSource source, int imageNumber) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (imageNumber == 1) {
          _image = File(pickedFile.path);
        }
      });
    }
  }
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  var isLength = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80, // Set this height
        titleSpacing: -6,
        backgroundColor: Colors.blueAccent.shade100,
        title: Text('My Profile',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_sharp),

        ),
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
                  Center(
                    child: InkWell(
                      onTap: ()=>_showPicker(context, 1),
                      child: Stack(
                        children: [
                          ClipOval(
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.black54,
                                child: _image == null
                                    ? Image.network(
                                  'https://picsum.photos/seed/picsum/200/300',
                                  fit: BoxFit.cover,
                                  width: 160,
                                  height: 160,
                                )
                                    : Image.file(
                                  _image!,
                                  fit: BoxFit.cover,
                                  width: 160,
                                  height: 160,
                                )
                            ),
                          ),
                          Positioned(
                            top: 55,
                            left: 60,
                              child: Icon(Icons.create))
                        ],
                      ),
                    ),
                  ),
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
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        hintText: "Select Location",
                        prefixIcon: Icon(Icons.location_on_outlined),
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
                    height: 15,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    maxLines: 5,
                    // controller: _number,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        hintText: "Write about your skills.",
                    ),
                  ),

                  SizedBox(height: 25,),
                  InkWell(
                    onTap: (){
                      //if (_signUpFormKey.currentState?.validate() ?? false);
                      // forgetpassword();
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.blue
                      ),
                      child: Center(child: Text('Save',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),
                    ),
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
