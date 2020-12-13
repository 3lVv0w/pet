import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:own_dog/scoped_model/user_model.dart';
import 'package:own_dog/views/pages/login_page.dart';
import 'package:scoped_model/scoped_model.dart';

class OwnDog extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics analytics = FirebaseAnalytics();
    final UserModel userModel = UserModel();

    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ScopedModel<UserModel>(
            model: userModel,
            child: MaterialApp(
              title: 'Owner Dog',
              theme: ThemeData(
                primarySwatch: Colors.blueGrey,
              ),
              home: LoginPage(),
              debugShowCheckedModeBanner: false,
              navigatorObservers: [
                FirebaseAnalyticsObserver(analytics: analytics),
              ],
            ),
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
