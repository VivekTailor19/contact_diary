
import 'package:flutter/material.dart';

import 'contactModel.dart';

List<ContactModel> contactList = [
  ContactModel(name: "VIVEK", no: 1000001),
  ContactModel(name: "NARENDRA MODI", no: 1000123, img: "Modi"),
  ContactModel(name: "Pawar", no: 1005464),
  ContactModel(name: "GAUTAM ADANI", no: 1009864),
  ContactModel(name: "RATAN TATA", no: 1000004, img: "TATA"),
  ContactModel(name: "BABURAV APTE", no: 1000002, img: "Apte"),
  ContactModel(name: "VIVEK", no: 1000001),
  ContactModel(name: "NARENDRA MODI", no: 1000123, img: "Modi"),
  ContactModel(name: "Pawar", no: 1005464),
  ContactModel(name: "GAUTAM ADANI", no: 1009864),
  ContactModel(name: "RATAN TATA", no: 1000004, img: "TATA"),
  ContactModel(name: "BABURAV APTE", no: 1000002, img: "Apte"),
];

class Prac_Contact_Display extends StatefulWidget {
  const Prac_Contact_Display({Key? key}) : super(key: key);

  @override
  State<Prac_Contact_Display> createState() => _Prac_Contact_DisplayState();
}

class _Prac_Contact_DisplayState extends State<Prac_Contact_Display> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.lightBlue.shade50,
        appBar: AppBar(backgroundColor: Colors.tealAccent.shade100,
          title: Text(
            "CONTACT DIARY",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.teal,letterSpacing: 2)),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
              itemCount: contactList.length,
              itemBuilder: (context, index) {
                return ContactTile(
                    name: contactList[index].name, no: contactList[index].no, img: contactList[index].img
                );
                },
          ),
            ),
            
        ]

      ),
    ));
  }

  Widget ContactTile({String? name, String? img, int? no})
  {
    return ListTile(
        title: Text("$name",style: TextStyle(fontWeight: FontWeight.bold,fontSize:20)),
        subtitle: Text("$no",style: TextStyle(fontSize: 15)),
        leading: (img==null)?Icon(Icons.person_outline,size: 25,):Text("$img",style: TextStyle(fontSize: 20),),

    );
  }


}
