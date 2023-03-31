import 'dart:io';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'contactModel.dart';

List<ContactModel> contactList = [
  ContactModel(
    name: "Darshan",
    no: "9904177670",
  ),
  ContactModel(
      name: "NARENDRA MODI", no: "1000123", img: "assets/images/modi.png"),
  ContactModel(name: "Pawar", no: "1005464"),
  ContactModel(
      name: "GAUTAM ADANI", no: "1009864", img: "assets/images/adani.png"),
  ContactModel(
      name: "RATAN TATA", no: "1000004", img: "assets/images/tata.png"),
  ContactModel(
      name: "BABURAV APTE", no: "1000002", img: "assets/images/baburav.png"),
  ContactModel(name: "VIVEK", no: "1000001"),
  ContactModel(
      name: "NARENDRA MODI", no: "1000123", img: "assets/images/modi.png"),
  ContactModel(name: "Darshan Kumbhani", no: "7046459707"),
  ContactModel(name: "GAUTAM ADANI", no: "1009864"),
  ContactModel(
      name: "RATAN TATA", no: "1000004", img: "assets/images/tata.png"),
  ContactModel(
      name: "BABURAV APTE", no: "1000002", img: "assets/images/baburav.png"),
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
        child: Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.tealAccent.shade100,
        title: Text("CONTACT DIARY",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
                letterSpacing: 2)),
        centerTitle: true,
        elevation: 0,
        actions: [InkWell(
          onTap: () async {
            String link = "https://www.meesho.com/";
            await launchUrl(Uri.parse(link));
          },
          child: Text("Shopping 🛍️",style:TextStyle(fontSize: 25,color: Colors.teal),
      ),
        ),],),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 20,
        ),
        backgroundColor: Colors.teal.shade700,
        onPressed: () {
          Navigator.pushNamed(context, "addcontact").then((value) {
            setState(() {});
          });
        },
      ),
      body: Column(children: [
        SizedBox(height: 15),
        Expanded(
          child: ListView.builder(
            itemCount: contactList.length,
            itemBuilder: (context, index) {
              return ContactTile(contactList[index],index);
            },
          ),
        ),
        SizedBox(height: 5),
      ]),
    ));
  }

  Widget ContactTile(ContactModel c , int i) {
    return ExpansionTile(
      title: Text("${c.name}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      subtitle: Text("${c.no}", style: TextStyle(fontSize: 15)),
      leading: c.img == null
          ? CircleAvatar(
              backgroundImage: AssetImage("assets/images/person.jpg"),
              radius: 25,
            )
          : CircleAvatar(
              radius: 25,
              backgroundImage: FileImage(
                File("${c.img}"),
              ),
            ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () async {
                  String link = "tel:${c.no}";
                  await launchUrl(Uri.parse(link));
                },
                icon: Icon(Icons.call, size: 20)),
            IconButton(
                onPressed: () async {
                   // Uri uri = Uri(
                   //    scheme: "sms",
                   //    path: "${c.no}",
                   //    queryParameters: {
                   //      "body":
                   //          " sample flutter sms test \n...જો બકા તકલીફ તો રેહવાની જ ..."
                   //    });
                  String link = "sms:${c.no}?body= sample flutter sms test \n...જો બકા તકલીફ તો રેહવાની જ ...";
                  await launchUrl(Uri.parse(link));

                },
                icon: Icon(Icons.message, size: 20)),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.add_circle_outline, size: 20)),
            IconButton(
                onPressed: () {
                  setState(() {
                    contactList.removeAt(i);
                  });

                }, icon: Icon(Icons.delete_forever, size: 20)),
            IconButton(
                onPressed: () {
                  Share.share(" ${c.img} & ${c.name} & ${c.no}");
                },
                icon: Icon(Icons.share, size: 20)),
          ],
        )
      ],
    );
  }
}
