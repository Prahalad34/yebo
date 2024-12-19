import 'package:flutter/material.dart';
class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80, // Set this height
        titleSpacing: -6,
        backgroundColor: Colors.blueAccent.shade100,
        title: Text('Location',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_sharp),

        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: SizedBox(
              width: double.infinity,
            child: Column(
              children: [
                Image.asset('assets/map.png'),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Expanded(
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7)
                              ),
                              hintText: 'Set Location',
                              prefixIcon: Icon(Icons.search),
                              suffixIcon: Icon(Icons.clear)
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7)
                                ),
                                hintText: 'Building Name(Optional)',
                              //  prefixIcon: Icon(Icons.search),
                              //  suffixIcon: Icon(Icons.clear)
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7)
                                ),
                                hintText: 'Street Address',
                              //  prefixIcon: Icon(Icons.search),
                               // suffixIcon: Icon(Icons.clear)
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7)
                                ),
                                hintText: 'Landmark(Optional)',
                              //  prefixIcon: Icon(Icons.search),
                              //  suffixIcon: Icon(Icons.clear)
                            ),
                          ),
                          SizedBox(
                            height: 10,
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
                              child: Center(child: Text('Choose This Location',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
