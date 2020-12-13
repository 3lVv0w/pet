import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DogCard extends StatelessWidget {
  final DocumentSnapshot document;

  const DogCard({
    this.document,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[300]),
      child: Card(
        child: Column(
          children: <Widget>[
            document['imagePath'] != ''
                ? Image.network(document['imagePath'])
                : Container(
                    width: 100,
                    height: 100,
                  ),
            Padding(
              padding: EdgeInsets.all(7.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Text(
                      "Name: ${document['name']} ${document['detail']}",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'K2D',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(7.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Icon(Icons.thumb_up),
                  ),
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Text(
                      'Like',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Mitr',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Icon(Icons.comment),
                  ),
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Text(
                      'Comments',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Mitr',
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
