import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:own_dog/scoped_model/user_model.dart';
import 'package:own_dog/views/pages/home_page.dart';
import 'package:own_dog/views/pages/register_page.dart';
import 'package:own_dog/widgets/email_input_form.dart';
import 'package:own_dog/widgets/password_input_form.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    final user = ScopedModel.of<UserModel>(context, rebuildOnChange: false);
    checkStatus(user);
  }

  Future<void> checkStatus(UserModel user) async {
    final User currentUser = firebaseAuth.currentUser;
    user.updateUserId(currentUser?.uid);
    if (currentUser != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => MyHomePage(),
        ),
      );
    }
  }

  Widget showLogo() {
    return SizedBox(
      width: 300.0,
      height: 300.0,
      child: FlareActor(
        'assets/flares/Doggo-storyoggo.flr',
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: 'stop',
      ),
    );
  }

  Widget showAppName() {
    return Text(
      'OWNER DOG',
      style: TextStyle(
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
        color: Colors.brown[900],
        fontFamily: 'Mitr',
      ),
    );
  }

  Widget content() {
    return Form(
      child: Column(
        children: <Widget>[
          showAppName(),
          SizedBox(
            height: 10.0,
          ),
          EmailInputForm(),
          SizedBox(
            height: 10.0,
          ),
          PasswordInputForm(),
          SizedBox(
            height: 35.0,
          ),
        ],
      ),
    );
  }

  Widget logInButton() {
    final user = ScopedModel.of<UserModel>(context, rebuildOnChange: false);
    return SizedBox(
      height: 40,
      width: 120,
      child: RaisedButton(
        color: Colors.yellow[800],
        child: Text(
          'LOG IN',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: () => checkAuthen(user),
      ),
    );
  }

  Widget registerButton() {
    return SizedBox(
      height: 40,
      width: 120,
      child: RaisedButton(
        color: Colors.blueGrey[100],
        child: Text('REGISTER'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => RegisterPage(),
          ),
        ),
      ),
    );
  }

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        logInButton(),
        SizedBox(
          width: 15.0,
        ),
        registerButton(),
      ],
    );
  }

  Future<void> checkAuthen(UserModel user) async {
    await firebaseAuth
        .signInWithEmailAndPassword(
      email: user.email,
      password: user.passowrd,
    )
        .then((response) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => MyHomePage(),
        ),
        // (Route<dynamic> route) => false,
      );
    }).catchError(
      (response) {
        alertScaffold(response.message);
      },
    );
  }

  void alertScaffold(String msg) {
    scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(msg, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.yellow[100],
              Colors.yellowAccent[700],
            ],
            radius: 0.7,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                showLogo(),
                content(),
                showButton(),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
