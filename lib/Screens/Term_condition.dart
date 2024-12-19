import 'package:flutter/material.dart';
class Term_condition extends StatefulWidget {
  const Term_condition({super.key});

  @override
  State<Term_condition> createState() => _Term_conditionState();
}

class _Term_conditionState extends State<Term_condition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80, // Set this height
        titleSpacing: -6,
        backgroundColor: Colors.blueAccent.shade100,
        title: Text('Term of Services',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_sharp),

        ),
        automaticallyImplyLeading: false,
      ),
    );
  }
}
