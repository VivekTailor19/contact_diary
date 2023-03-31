

import 'dart:io';

import 'package:contact_diary/contact/contactModel.dart';
import 'package:contact_diary/contact/contact_diary.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Add_Contact extends StatefulWidget {
  const Add_Contact({Key? key}) : super(key: key);

  @override
  State<Add_Contact> createState() => _Add_ContactState();
}

class _Add_ContactState extends State<Add_Contact> {
  TextEditingController tname = TextEditingController();
  TextEditingController tcontact = TextEditingController();

  String loca = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [

                  loca == null ?  CircleAvatar(backgroundImage:  AssetImage("assets/images/person.jpg"),radius: 60,) :
                       CircleAvatar(radius: 80,backgroundImage: FileImage(File("$loca")),),

                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(backgroundColor: Colors.lightBlueAccent),
                        onPressed: () async {
                          ImagePicker pic = ImagePicker();
                          XFile? xfile =
                              await pic.pickImage(source: ImageSource.camera);

                          setState(() {
                            loca = xfile!.path;
                          });
                        },
                        child: Text("📷 Camera 📷",style: TextStyle(fontSize: 20,color: Colors.black),)),
                    TextButton(style: TextButton.styleFrom(backgroundColor: Colors.yellowAccent.shade100),
                        onPressed: () async {
                          ImagePicker pic = ImagePicker();
                          XFile? xfile =
                              await pic.pickImage(source: ImageSource.gallery);

                          setState(() {
                            loca = xfile!.path;
                          });
                        },
                        child: Text("📁 Upload 📁",style: TextStyle(fontSize: 20,color: Colors.black),)),
                  ],
                ),
                SizedBox(height: 15),
                TextField(
                  keyboardType: TextInputType.text,
                  controller: tname,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black12,
                      hintText: "Enter Name",
                      hintStyle: TextStyle(fontSize: 15, wordSpacing: 3),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
                SizedBox(height: 15),
                TextField(
                  keyboardType: TextInputType.phone,
                  controller: tcontact,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black12,
                      hintText: "Enter Contact Number",
                      hintStyle: TextStyle(fontSize: 15, wordSpacing: 3),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    String contact = tcontact.text;
                    String name = tname.text;

                    ContactModel c_add = ContactModel(name: name, no: contact,img: loca);

                    contactList.add(c_add);

                    Navigator.pop(context);
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(wordSpacing: 2, fontSize: 20),
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
