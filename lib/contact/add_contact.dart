import 'package:contact_diary/contact/contactModel.dart';
import 'package:contact_diary/contact/contact_diary.dart';
import 'package:flutter/material.dart';

class Add_Contact extends StatefulWidget {
  const Add_Contact({Key? key}) : super(key: key);

  @override
  State<Add_Contact> createState() => _Add_ContactState();
}

class _Add_ContactState extends State<Add_Contact> {

  TextEditingController tname = TextEditingController();
  TextEditingController tcontact = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                CircleAvatar(backgroundImage: NetworkImage("https://www.kindpng.com/picc/m/106-1068054_free-png-happy-person-png-images-transparent-happy.png"),radius: 70,),
                SizedBox(height: 15),
                TextField(
                  controller:tname,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black12,
                    hintText: "Enter Name",
                    hintStyle: TextStyle(fontSize: 15,wordSpacing: 3),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: tcontact,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black12,
                    hintText: "Enter Contact Number",
                    hintStyle: TextStyle(fontSize: 15,wordSpacing: 3),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                  ),
                ),

                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {


                  int contact = int.parse(tcontact.text);
                  String name = tname.text;

                  ContactModel c_add = ContactModel(name: name,no : contact);

                  contactList.add(c_add);

                  Navigator.pop(context);


                }, child: Text("Submit",style: TextStyle(wordSpacing: 2,fontSize: 15),),

                )

              ],
            ),
          ),
        ),

      ),
    );
  }
}
