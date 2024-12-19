import 'package:flutter/material.dart';
import 'package:yubeo/Screens/Filter.dart';
class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80, // Set this height
        backgroundColor: Colors.blueAccent.shade100,
        title: Text('Search',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        // leading: IconButton(onPressed: () {
        //   Navigator.pop(context);
        // }, icon: Icon(Icons.arrow_back_ios_new_sharp),
        //
        // ),
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
                        hintText: "Search",
                      suffixIcon:InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Filter(),));
                        },
                          child: Icon(Icons.filter_list_alt))
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
