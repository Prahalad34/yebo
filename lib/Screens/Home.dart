import 'package:flutter/material.dart';
import 'package:yubeo/Screens/Publish_Task.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  List<String> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: new FloatingActionButton(
          shape: CircleBorder(),
            elevation: 0.0,
            child: new Icon(Icons.create,color: Colors.white,),
            backgroundColor: Colors.blue,
            onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Publish_Task(selectedCategories: selectedCategories,),));
            }
        ),
      body: Image.asset('assets/asiamap.png',fit: BoxFit.cover,height: 800,),
    );
  }
}
