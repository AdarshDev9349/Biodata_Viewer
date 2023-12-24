// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

class Dataview extends StatefulWidget {
  const Dataview({super.key});
  @override
  State<Dataview> createState() => DataviewpageState();
}

String bio_name = '';
String gender = '';
String dob = '';
String bio_age = '';
String occup = '';
String address = '';

class DataviewpageState extends State<Dataview> {
  TextEditingController editingController = TextEditingController();
  TextEditingController edit = TextEditingController();
  TextEditingController textedit = TextEditingController();
  TextEditingController edittext = TextEditingController();
  TextEditingController gendercn = TextEditingController();
  TextEditingController dobcn = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: const Text(
              "BioData Viewer",
              style: TextStyle(
                fontSize: 40,
              ),
            )),
        toolbarHeight: 200,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 200, top: 10, right: 200),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: editingController,
              decoration: const InputDecoration(label: Text('Name')),
            ),
            TextFormField(
              controller: gendercn,
              decoration: InputDecoration(label: Text("Gender")),
            ),
            TextFormField(
              controller: edit,
              decoration: const InputDecoration(label: Text('Age')),
            ),
            TextFormField(
              controller: dobcn,
              decoration: InputDecoration(label: Text("Date of Birth")),
            ),
            TextFormField(
              controller: textedit,
              decoration: InputDecoration(label: Text("Occupation")),
            ),
            TextFormField(
              controller: edittext,
              decoration: InputDecoration(label: Text("Address")),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  bio_name = editingController.text;
                  bio_age = edit.text;
                  gender = gendercn.text;
                  dob = dobcn.text;
                  occup = textedit.text;
                  address = edittext.text;
                  if (kDebugMode) {
                    print('$bio_name is $bio_age');
                  }
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BioDatapage()));
                });
              },
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biodata viewer',
      home: Dataview(),
    );
  }
}

class BioDatapage extends StatefulWidget {
  const BioDatapage({super.key});

  @override
  State<BioDatapage> createState() => BioDatapageState();
}

class BioDatapageState extends State<BioDatapage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Padding(
            padding: EdgeInsets.only(top: 60),
            child: const Text(
              'BioData',
              style: TextStyle(fontSize: 50),
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: $bio_name',
                style: TextStyle(fontSize: 20),
              ),
              Text('Gender:$gender', style: TextStyle(fontSize: 20)),
              Text('Date of Birth : $dob', style: TextStyle(fontSize: 20)),
              Text('Age : $bio_age', style: TextStyle(fontSize: 20)),
              Text('Occupation : $occup', style: TextStyle(fontSize: 20)),
              Text('Address: $address', style: TextStyle(fontSize: 20)),
            ],
          ),
        ));
  }
}
