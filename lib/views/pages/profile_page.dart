import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:own_dog/views/pages/login_page.dart';
import 'dart:io' show Platform;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String displayName;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    findDisplayName();
  }

  Future<void> findDisplayName() async {
    final User firebaseUser = _auth.currentUser;
    setState(() {
      displayName = firebaseUser.displayName;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> processSignOut() async {
      await _auth.signOut().then(
        (response) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => LoginPage(),
            ),
            (Route<dynamic> route) => false,
          );
        },
      );
    }

    Widget okButton() {
      return FlatButton(
        child: Text(
          'OK',
          style: TextStyle(color: Colors.blue),
        ),
        onPressed: () {
          processSignOut();
        },
      );
    }

    Widget cancelButton() {
      return FlatButton(
        child: Text(
          'Cancel',
          style: TextStyle(color: Colors.blue),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );
    }

    void myAlert() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return Platform.isIOS
              ? CupertinoAlertDialog(
                  title: Text('Are you sure?'),
                  content: Text('Do you want to SIGN OUT?'),
                  actions: <Widget>[
                    cancelButton(),
                    okButton(),
                  ],
                )
              : AlertDialog(
                  title: Text('Are you sure?'),
                  content: Text('Do you want to SIGN OUT?'),
                  actions: <Widget>[
                    cancelButton(),
                    okButton(),
                  ],
                );
        },
      );
    }

    Widget signOutButton() {
      return IconButton(
        icon: Icon(Icons.exit_to_app),
        tooltip: 'Sign Out',
        onPressed: myAlert,
      );
    }

    Widget showLogoProfile() {
      return Padding(
        padding: EdgeInsets.all(7.0),
        child: Icon(
          Icons.face,
          size: 60,
        ),
      );
    }

    Widget showContent() {
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.blueGrey[50],
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        showLogoProfile(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.note),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "$displayName",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'K2D',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.call),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '0122334567',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'K2D',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: <Widget>[
          showContent(),
          signOutButton(),
        ],
      ),
    );
  }
}
