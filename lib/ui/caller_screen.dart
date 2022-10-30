import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class CallerScreen extends StatelessWidget {
  const CallerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Ambulance'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              const Text("Shikder Ambulance Service", style: TextStyle(
                fontSize: 22,
                backgroundColor: Colors.grey,
              ),),
              ElevatedButton(
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber('+8801713260042');
                },
                child: const Text('Call'),

              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              const Text(" Online  Ambulance  service ", style: TextStyle(
                fontSize: 22,
                backgroundColor: Colors.grey,
              ),),
              ElevatedButton(
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber('+8801627669222');
                },
                child: const Text('Call'),

              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              const Text("Hawlader Ambulance Service", style: TextStyle(
                fontSize: 22,
                backgroundColor: Colors.grey,
              ),),
              ElevatedButton(
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber('+8801727059122');
                },
                child: const Text('Call'),

              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              const Text(" Popular Ambulance  Service ", style: TextStyle(
                fontSize: 22,
                backgroundColor: Colors.grey,
              ),),
              ElevatedButton(
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber('+8801926011168');
                },
                child: const Text('Call'),

              ),
            ],
          ),
        ],
      )

    );
  }
}
