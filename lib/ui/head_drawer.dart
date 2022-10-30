import 'package:flutter/material.dart';

class HeadDrawer extends StatefulWidget {
  const HeadDrawer({super.key});

  @override
  _HeadDrawerState createState() => _HeadDrawerState();
}

class _HeadDrawerState extends State<HeadDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[700],
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'HelpMate',
            style: TextStyle(color: Colors.white, fontSize: 40),
          ),
          Text(
            'omarfaruk4543@gmail.com',
            style: TextStyle(color: Colors.grey[200], fontSize: 14),
          ),
          Text(
            'rahat040@engineer.com',
            style: TextStyle(color: Colors.grey[200], fontSize: 14),
          ),
          Text(
            'mdabusufian1204@gmail.com',
            style: TextStyle(color: Colors.grey[200], fontSize: 14),
          ),
        ],
      ),
    );
  }
}
