import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[600],
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              height: 70.0,
              alignment: Alignment.topCenter,
              child: Lottie.asset(
                'assets/Animation_drawer.json',
                width: double.infinity,
              )),
          const Text(
            "Espresso Edu",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const Text(
            "Silvia Nur Baiti_21552011400",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
