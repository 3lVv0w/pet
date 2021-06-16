import 'package:flutter/material.dart';
import 'package:pet/views/pages/dog_map.dart';
import 'package:pet/views/pages/profile_page.dart';
import 'package:pet/widgets/show_list_dog.dart';
import 'package:pet/widgets/add_list_dog.dart';

import 'profile_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> showWidgets = [
    ShowListDog(),
    DogMap(),
    AddListDog(),
    ProfilePage(),
  ];

  int index = 0;

  BottomNavigationBarItem homeNav() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.home, size: 30),
      label: 'Home',
    );
  }

  BottomNavigationBarItem findDogMapNav() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.map, size: 30),
      label: 'Dog Map',
    );
  }

  BottomNavigationBarItem findDogNav() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.pageview, size: 30),
      label: 'Find Dog',
    );
  }

  BottomNavigationBarItem regisDogNav() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.add_box, size: 30),
      label: 'Register Dog',
    );
  }

  BottomNavigationBarItem profile() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.person, size: 30),
      label: 'Profile',
    );
  }

  Widget profileButton() {
    return IconButton(
      icon: Icon(
        Icons.account_circle,
        size: 30,
      ),
      tooltip: 'Profile',
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => ProfilePage(),
        ),
      ),
    );
  }

  Widget myButtonNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (int i) {
        setState(() {
          index = i;
        });
      },
      currentIndex: index,
      items: <BottomNavigationBarItem>[
        homeNav(),
        findDogMapNav(),
        regisDogNav(),
        profile(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PETS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'K2D',
          ),
        ),
        centerTitle: true,
        elevation: 1.0,
        backgroundColor: Colors.yellowAccent[700],
      ),
      body: showWidgets[index],
      bottomNavigationBar: myButtonNavBar(),
    );
  }
}
