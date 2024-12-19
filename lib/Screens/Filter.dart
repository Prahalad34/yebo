import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {

  final TextEditingController _controller = new TextEditingController();
  var items = ['AC Repair','Car Repair','Carpool','Cleaning','Electronics','Marine Repair','Online service','Painting','Plumbing','Remote Assistance','Spare Parts Supply','Tech Support'];

  String? gender;

  TextEditingController fromdate = TextEditingController();
  TextEditingController todate = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    fromdate.text = ""; //set the initial value of text field
    todate.text = ""; //set the initial value of text field
    super.initState();
  }

  //text editing controller for text field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80, // Set this height
        titleSpacing: -6,
        backgroundColor: Colors.blueAccent.shade100,
        title: Text('Filter',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text("Sort By",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.blue),),
                Divider(
                  height: 20,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Select Category",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black)),
                SizedBox(height: 10,),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7)
                    ),
                    hintText: 'All',
                    suffixIcon: PopupMenuButton<String>(
                      icon: const Icon(Icons.arrow_drop_down_sharp),
                      onSelected: (String value) {
                        _controller.text = value;
                      },
                      itemBuilder: (BuildContext context) {
                        return items
                            .map<PopupMenuItem<String>>((String value) {
                          return new PopupMenuItem(
                              child: new Text(value), value: value);
                        }).toList();
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Price",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black)),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Low to high"),
                    Radio(
                      activeColor: Colors.blue,
                      value: "Low to high",
                      groupValue: gender,
                      onChanged: (value){
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("High to low"),
                    Radio(
                      activeColor: Colors.blue,
                      value: "High to low",
                      groupValue: gender,
                      onChanged: (value){
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('From Date',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black)),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: TextField(
                              controller: fromdate,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(12),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  hintText: "08.03.2024",
                                  suffixIcon: Icon(Icons.date_range)
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

                                  setState(() {
                                    fromdate.text = formattedDate; //set output date to TextField value.
                                  });
                                }else{
                                  print("Date is not selected");
                                }
                              },
                            ),
                          ),

                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('To Date',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black)),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextField(
                              controller: todate,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(12),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  hintText: "08.03.2024",
                                  suffixIcon: Icon(Icons.date_range)
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

                                  setState(() {
                                    todate.text = formattedDate; //set output date to TextField value.
                                  });
                                }else{
                                  print("Date is not selected");
                                }
                              },
                            ),
                          ),

                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Text('Distance',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black)),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    hintText: "Enter"
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue
                      ),
                      child: Center(child: Text("Apply",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.blue)
                        ),
                        child: Center(child: Text("Cancel",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
