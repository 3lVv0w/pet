import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:own_dog/scoped_model/user_model.dart';
import 'package:own_dog/views/pages/login_page.dart';
import 'package:scoped_model/scoped_model.dart';

class OwnDog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics analytics = FirebaseAnalytics();
    final UserModel userModel = UserModel();

    return ScopedModel<UserModel>(
      model: userModel,
      child: MaterialApp(
        title: 'Owner Dog',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: LoginPage(),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
      ),
    );
  }
}
