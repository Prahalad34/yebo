import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:yubeo/Screens/Category_Preference.dart';
import 'package:yubeo/Screens/Location.dart';

import '../Constants/AppColors.dart';
class Publish_Task extends StatefulWidget {
  final List<String> selectedCategories;
  const Publish_Task({super.key, required  this.selectedCategories});

  @override
  State<Publish_Task> createState() => _Publish_TaskState();
}

class _Publish_TaskState extends State<Publish_Task> {

  TextStyle basicText = TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.w600,
      color: AppColors.blackColor);

  TextStyle smallText = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor);

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
                    _getImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: () {
                    _getImage(ImageSource.camera);
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
  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (pickedFile != null) {
          _images.add(File(pickedFile.path)); // Add image to the list
        }
      });
    }
  }
  
  bool ischecked = false;

  TextEditingController dateinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  TextEditingController timeinput = TextEditingController();
  //text editing controller for text field

  @override
  void initState1() {
    timeinput.text = ""; //set the initial value of text field
    super.initState();
  }
  List<String> selectedCategories = [];
  List<File> _images = [];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80, // Set this height
        titleSpacing: -6,
        backgroundColor: Colors.blueAccent.shade100,
        title: Text('Publish Task',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_sharp),

        ),
        automaticallyImplyLeading: false,
      ),
        // floatingActionButton: new FloatingActionButton(
        //     onPressed: () {  },
        //     child: Container(
        //       height: 40,
        //         width: 150,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(8),
        //           color: Colors.blue
        //         ),
        //         child: Text("Publish",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),)),
        // ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Describe The Task",style: basicText,),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                        width: 0
                      )
                    ),
                    hintText: "Be as detailed as possible...",
                      filled: true,
                      fillColor: Colors.grey.shade200
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Upload task photo",style: basicText,),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () => _showPicker(context, 1),
                  child: Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade200,
                    ),
                    child: _images.isNotEmpty // Display images if available
                        ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemCount: _images.length,
                      itemBuilder: (context, index) {
                        return Image.file(_images[index], fit: BoxFit.cover);
                      },
                    )
                        : Center(child: Icon(Icons.camera_alt_outlined)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Select Category",style: basicText,), SizedBox(
                  height: 10,
                ),
                TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(
                        style: BorderStyle.none,
                        width: 0
                      )
                    ),
                      hintText: widget.selectedCategories.isNotEmpty
                          ? widget.selectedCategories.join(", ")
                          : "selecte categories",
                    suffixIcon: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Category_Preference(),));
                      },
                        child: Icon(Icons.arrow_forward_ios)),
                    filled: true,
                    fillColor: Colors.grey.shade200
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text("Payment",style: basicText,),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide(
                                style: BorderStyle.none,
                                width: 0
                              )
                            ),
                            hintText: 'Enter Amount(AED)',
                            filled: true,
                            fillColor: Colors.grey.shade200
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          ischecked = !ischecked;
                        });
                      },
                        child: ischecked
                            ? Icon(Icons.check_box, color: Colors.blue)
                            : Icon(Icons.check_box_outline_blank_outlined,),),
                    SizedBox(width: 8,),
                    Text("Pay by hour")
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                if(ischecked)
                Row(
                  children: [
                    Text("Hour",style: basicText,),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(
                                      style: BorderStyle.none,
                                      width: 0
                                  )
                              ),
                              hintText: 'Enter hour',
                              filled: true,
                              fillColor: Colors.grey.shade200
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Schedule',style: basicText,),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: TextField(
                          controller: dateinput,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(12),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      style: BorderStyle.none,
                                      width: 0
                                  )
                              ),
                              hintText: "Select Date",
                             filled: true,
                             fillColor: Colors.grey.shade200
                             // suffixIcon: Icon(Icons.date_range)
                          ),
                          readOnly: true,  //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context, initialDate: DateTime.now(),
                                firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101)
                            );

                            if(pickedDate != null ){
                              print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(formattedDate); //formatted date output using intl package =>  2021-03-16
                              //you can implement different kind of Date Format here according to your requirement

                              // setState(() {
                              //   dateinput.text = formattedDate; //set output date to TextField value.
                              // });
                            }else{
                              print("Date is not selected");
                            }
                          },
                        ),
                      ),
                    ),
                  //  SizedBox(height: 15,),
                   // Text('Time',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  //  SizedBox(height: 10,),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextField(
                          controller: timeinput,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                style: BorderStyle.none,
                                width: 0,
                              ),
                            ),
                            hintText: 'Select Time',
                            filled: true,
                            fillColor: Colors.grey.shade200,
                          ),
                          readOnly: true,
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                            );

                            if (pickedTime != null) {
                              // Print the selected time in the default format
                              print(pickedTime.format(context)); // Example: 10:51 PM

                              // Convert TimeOfDay to DateTime
                              DateTime now = DateTime.now();
                              DateTime parsedTime = DateTime(
                                now.year,
                                now.month,
                                now.day,
                                pickedTime.hour,
                                pickedTime.minute,
                              );

                              // Format the time to the desired format
                              String formattedTime = DateFormat('hh:mm a').format(parsedTime);
                              print(formattedTime); // Example: 10:53 PM

                              // Update the text field with the formatted time
                              // setState(() {
                              //   timeinput.text = formattedTime;
                              // });
                            } else {
                              print("Time is not selected");
                            }
                          },
                        ),
                      ),
                    ),


                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Select Location",style: basicText,),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Location(),
                    ));

                  },
                  child: TextFormField(
                    // controller: _number,
                    readOnly: true,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(
                            style: BorderStyle.none,
                            width: 0
                          )
                        ),
                        hintText: "Select Location",
                       // prefixIcon: Icon(Icons.location_on_outlined),
                        suffixIcon: InkWell(onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Location(),));
                        },
                            child: Icon(Icons.arrow_forward_ios)),
                      filled: true,
                      fillColor: Colors.grey.shade200
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue
                    ),
                    child: Center(child: Text("Publish",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),))),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
