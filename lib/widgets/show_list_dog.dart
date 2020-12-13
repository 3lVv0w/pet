import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:own_dog/scoped_model/user_model.dart';
import 'package:own_dog/widgets/dog_card.dart';
import 'package:scoped_model/scoped_model.dart';

class ShowListDog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = ScopedModel.of<UserModel>(context, rebuildOnChange: true);
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('dogs')
          .where('owner', isEqualTo: user.userId)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          default:
            return ListView(
              children: snapshot.data.docs.map(
                (DocumentSnapshot document) {
                  return DogCard(document: document);
                },
              ).toList(),
            );
        }
      },
    );
  }
}
