import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class My_Bids extends StatefulWidget {
  const My_Bids({super.key});

  @override
  State<My_Bids> createState() => _My_BidsState();
}

class _My_BidsState extends State<My_Bids> {


  int isActive = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80, // Set this height
        titleSpacing: -6,
        backgroundColor: Colors.blueAccent.shade100,
        title: Text('My Bids',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
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
            child: Column(
              children: [
                Card(
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(
                                style: BorderStyle.none,
                                width: 0
                            )
                        ),
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search"
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          isActive =0;
                        });
                        Fluttertoast.showToast(
                            msg: "Pending",
                            backgroundColor: Colors.black,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      },
                      child: Container(
                        height: 35,
                        width: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: isActive == 0? Colors.blue:Colors.grey
                        ),
                        child: Center(child: Text("Pending",style: TextStyle(color: Colors.white),),),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          isActive = 1;
                        });
                        Fluttertoast.showToast(
                            msg: "Accepted",
                            backgroundColor: Colors.black,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      },
                      child: Container(
                        height: 35,
                        width: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: isActive == 1? Colors.blue:Colors.grey
                        ),
                        child: Center(child: Text("Accepted",style: TextStyle(color: Colors.white),),),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          isActive = 2;
                        });
                        Fluttertoast.showToast(
                            msg: "Completed",
                            backgroundColor: Colors.black,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      },
                      child: Container(
                        height: 35,
                        width: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: isActive == 2? Colors.blue:Colors.grey
                        ),
                        child: Center(child: Text("Completed",style: TextStyle(color: Colors.white),),),
                      ),
                    ),

                  ],
                ),

                isActive == 0 ?
                Pending()
                    : isActive == 1 ?
                Accepted()
                    : Completed()


              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Pending()=> Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text("No Pending Data",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
    ],
  );

  Widget Accepted()=> Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text("No Accepted Data",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
    ],
  );

  Widget Completed()=> Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text("No Completed Data",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
    ],
  );



}
