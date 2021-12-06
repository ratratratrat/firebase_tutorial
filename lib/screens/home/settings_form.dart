import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/modals.dart';
import 'package:firebase_tutorial/services/database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_tutorial/constants.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4', '5'];

  String? currentName;
  String? currentEmail;
  String? currentSugar;
  int currentStrength = 100;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    return StreamBuilder<UserModal>(
        stream: DatabaseService(user!.uid).docSnap,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserModal? userData = snapshot.data;
            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    QrImage(
                      data: user.uid,
                      version: QrVersions.auto,
                      size: 200.0,
                      // embeddedImage: AssetImage('assets/images/midland.png'),
                    ),
                    Text(
                      'Update Settings',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      initialValue: userData?.name,
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
                      initialValue: userData?.email,
                      decoration: textFieldDecoration,
                      validator: (val) =>
                          val!.isEmpty ? 'Enter an Email' : null,
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
                    Slider(
                      activeColor: Colors.pink[currentStrength],
                      inactiveColor: Colors.grey,
                      min: 100,
                      max: 900,
                      divisions: 8,
                      label: currentStrength.toString(),
                      onChanged: (val) {
                        setState(() {
                          currentStrength = val.round();
                        });
                      },
                      value: (currentStrength).toDouble(),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                        child: Text('Update'),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            //   await Future.delayed(Duration(seconds: 3));
                            // if (currentSugar == null) {
                            //   currentSugar = '0';
                            // }

                            // if (currentStrength == null) {
                            //   currentStrength = 100;
                            // }

                            // currentName ??= userData!.name;

                            // currentEmail ??= userData!.email;

                            await DatabaseService(userData!.uid).updateUserData(
                                currentName ?? userData.name,
                                currentEmail ?? userData.email);
                            Navigator.pop(context);
                          }
                        }),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
