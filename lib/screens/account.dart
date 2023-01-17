import 'package:flutter/material.dart';

class Accountpage extends StatelessWidget {
  const Accountpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Account'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile.webp'),
              ),
            ),
            Text('Name'),
            Text('XYZ'),
          ],
        ));
  }
}
