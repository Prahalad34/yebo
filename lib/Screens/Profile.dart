import 'package:flutter/material.dart';
import 'package:yubeo/Screens/Category_Preference.dart';
import 'package:yubeo/Screens/Change_password.dart';
import 'package:yubeo/Screens/My_Bids.dart';
import 'package:yubeo/Screens/My_Profile.dart';
import 'package:yubeo/Screens/My_Tasks.dart';
import 'package:yubeo/Screens/Term_condition.dart';

import '../Constants/AppColors.dart';
import 'Login.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  TextStyle basicText = TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.w600,
      color: AppColors.blackColor);

  TextStyle smallText = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
    toolbarHeight: 80, // Set this height
    backgroundColor: Colors.blueAccent.shade100,
    title: Text('Profile',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
    automaticallyImplyLeading: false,
          ),
          body: Padding(
    padding: const EdgeInsets.all(22.0),
    child: SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Card(
              child: Container(
                height: 110,
                width: MediaQuery.of(context).size.width ,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Wrap(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.black54,
                        child: Icon(Icons.account_circle_outlined,size: 60,),
                      ),
                      SizedBox(width: 12,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text('P s',style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("12345678"),
                          Text("p@g.com"),
                          Padding(
                            padding: const EdgeInsets.only(left: 200),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => My_Profile(),));
                              },
                                child: Icon(Icons.create,color: Colors.grey,)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blue.shade300
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("O"),
                            Text("Complete Tasks",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue.shade300
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("O"),
                            Text("Published Tasks",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue.shade300
                        ),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("AED0"),
                            Text("Earnings",style: TextStyle(fontWeight: FontWeight.bold),)
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => My_Tasks(),));
                    },
                    child: Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.black38)
                      ),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width ,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.settings_applications),
                              SizedBox(width: 10,),
                              Expanded(child: Text("My Tasks",style: basicText,)),
                              Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,)
                            ]
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => My_Bids(),));
                    },
                    child: Card(
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.black38)
                      ),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width ,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              children: [
                                Icon(Icons.task_alt_sharp),
                                SizedBox(width: 10,),
                                Expanded(child: Text("My Bids",style: basicText,)),
                                Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,)
                              ]
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Category_Preference(),));
                    },
                    child: Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.black38)
                      ),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width ,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              children: [
                                Icon(Icons.access_alarm),
                                SizedBox(width: 10,),
                                Expanded(child: Text("Category Preference",style: basicText,)),
                                Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,)
                              ]
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Change_password(),));
                    },
                    child: Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.black38)
                      ),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width ,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              children: [
                                Icon(Icons.lock_outline),
                                SizedBox(width: 10,),
                                Expanded(child: Text("Change Password",style: basicText,)),
                                Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,)
                              ]
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Term_condition(),));
                    },
                    child: Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.black38)
                      ),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width ,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              children: [
                                Icon(Icons.menu_book_sharp),
                                SizedBox(width: 10,),
                                Expanded(child: Text("Terms & Conditions",style: basicText,)),
                                Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,)
                              ]
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                    },
                    child: Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.black38)
                      ),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width ,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              children: [
                                Icon(Icons.logout),
                                SizedBox(width: 10,),
                                Expanded(child: Text("Logout",style: basicText,)),
                                Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,)
                              ]
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
          ),
        );
  }
}
