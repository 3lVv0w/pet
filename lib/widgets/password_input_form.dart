import 'package:flutter/material.dart';
import 'package:own_dog/scoped_model/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class PasswordInputForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = ScopedModel.of<UserModel>(context, rebuildOnChange: true);
    return Container(
      width: 350.0,
      child: TextFormField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock_outline,
            size: 25.0,
            color: Colors.brown,
          ),
          labelText: 'PASSWORD',
          labelStyle: TextStyle(
            color: Colors.brown,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onChanged: (String value) => user.updatePassword(value.trim()),
        obscureText: true,
      ),
    );
  }
}
