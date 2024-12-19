import 'package:flutter/material.dart';
import 'package:yubeo/Screens/Publish_Task.dart';

import '../Constants/AppColors.dart';
class Category_Preference extends StatefulWidget {
  const Category_Preference({super.key});

  @override
  State<Category_Preference> createState() => _Category_PreferenceState();
}

class _Category_PreferenceState extends State<Category_Preference> {

  TextStyle basicText = TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.w600,
      color: AppColors.blackColor);

  TextStyle smallText = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor);

  List<String> selectedCategories = [];
  Set<int> selectedItems = {};

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80, // Set this height
        titleSpacing: -6,
        backgroundColor: Colors.blueAccent.shade100,
        title: Text('Category Preference',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_sharp),

        ),
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
              SizedBox(height: 15,),
              Text("You'll receive notification when a task is\npublished by someone in the categories you\nselect here.",style: smallText,),
              SizedBox(height: 20,),
              Expanded(
                child: SingleChildScrollView(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 7.3/3.5
                    ),
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount:arrname.length ,
                    itemBuilder: (BuildContext ctx, index){
                      return Card(
                        child: Container(
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Padding(
                               padding: const EdgeInsets.all(12.0),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text(arrname[index],style: basicText,),
                                   SizedBox(width: 8,),
                                   InkWell(
                                     onTap: () {
                                       setState(() {
                                         if (selectedItems.contains(index)) {
                                           selectedItems.remove(index);
                                           selectedCategories.remove(arrname[index]);
                                         } else {
                                           selectedItems.add(index);
                                           selectedCategories.add(arrname[index]);
                                         }
                                       });
                                     },
                                     child: selectedItems.contains(index)
                                         ? Icon(Icons.check_box, color: Colors.blue)
                                         : Icon(Icons.check_box_outline_blank,),
                                   ),

                                 ],
                               ),
                             )
                           ],
                         ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 30,),
              InkWell(
                onTap: (){
                  //if (_signUpFormKey.currentState?.validate() ?? false);
                  // forgetpassword();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Publish_Task(selectedCategories: selectedCategories),));
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
    );
  }
}

 var arrname = ['AC Repair','Car Repair','Carpool','Cleaning','Electronics','Marine\nRepair','Online\nservice','Painting','Plumbing','Remote\nAssistance','Spare Parts\nSupply','Tech\nSupport'];
