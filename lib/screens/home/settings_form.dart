import 'package:flutter/material.dart';
import 'package:firebase_tutorial/constants.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4', '5'];

  late String currentName;
  late String currentEmail;
   String? currentSugar;

   void setsugar(String value){
     setState(() {
       currentSugar = value;
     });
   }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Update Settings',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 30),
          TextFormField(
            decoration: textFieldDecoration,
            validator: (val) => val!.isEmpty ? 'Enter an Name' : null,
            // obscureText: true,
            onChanged: (val) {
              setState(() {
                currentName = val;
              });
            },
          ),
          SizedBox(height: 30),
          TextFormField(
            decoration: textFieldDecoration,
            validator: (val) => val!.isEmpty ? 'Enter an Email' : null,
            // obscureText: true,
            onChanged: (val) {
              setState(() {
                currentEmail = val;
              });
            },
          ),
          SizedBox(height: 30),
          DropdownButtonFormField(
            decoration: textFieldDecoration,
            value: currentSugar ?? '0',
            onChanged: (String? newValue) {
              setState(() {
                currentSugar = newValue!;
              });
            },
            items: sugars.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text('$e sugars'),
              );
            }).toList(),
          ),
          SizedBox(height: 30),



          
          SizedBox(height: 30),
          ElevatedButton(
              child: Text('Update'),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  //   await Future.delayed(Duration(seconds: 3));
                  if(currentSugar == null){
                    currentSugar = '0';
                  }
                  print(currentName);
                  print(currentEmail);
                  print(currentSugar);
                }
              }),
        ],
      ),
    );
  }
}
