import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:humanitarian_icons/humanitarian_icons.dart';

import 'caller_screen.dart';

class PageTitle extends StatefulWidget {
  const PageTitle({Key? key}) : super(key: key);

  @override
  State<PageTitle> createState() => _PageTitleState();
}

class _PageTitleState extends State<PageTitle> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scalFactor = 0.8;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //First part tittle container
        SizedBox(
          height: 240,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: const DotsDecorator(
            color: Colors.black87, // Inactive color
            activeColor: Colors.red,
          ),
        ),
// for gap between two container
        const SizedBox(
          height: 5,
        ),

        // 2nd Part of home page
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightBlueAccent),
                    height: 65,
                    width: 65,
                    child: InkWell(
                      splashColor: Colors.green,
                      onTap: () {
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>const CallerScreen()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            HumanitarianIcons.ambulance,
                            size: 40,
                          ), // <-- Icon
                          Text("Amb"), // <-- Text
                        ],
                      ),
                    ),
                  ),
                ),

                //SizedBox(width: 50),

                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightBlueAccent),
                    height: 65,
                    width: 65,
                    child: InkWell(
                      splashColor: Colors.green,
                      onTap: () async {
                        await FlutterPhoneDirectCaller.callNumber('+8801320001299');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.local_police_outlined,
                            size: 40,
                          ), // <-- Icon
                          Text("Police"), // <-- Text
                        ],
                      ),
                    ),
                  ),
                ),
                //SizedBox(width: 40),
                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightBlueAccent),
                    height: 65,
                    width: 65,
                    child: InkWell(
                      splashColor: Colors.green,
                      onTap: () async {
                        await FlutterPhoneDirectCaller.callNumber('+88043165222');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.local_fire_department,
                            size: 40,
                          ), // <-- Icon
                          Text(
                            "Fire",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ), // <-- Text
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(35),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightBlueAccent),
                    height: 65,
                    width: 70,
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: ()  async {
                        await FlutterPhoneDirectCaller.callNumber('999');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            HumanitarianIcons.alert,
                            size: 40,
                          ), // <-- Icon
                          Text("Emergency"), // <-- Text
                        ],
                      ),
                    ),
                  ),
                ),
                //SizedBox(width: 50),
                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightBlueAccent),
                    height: 65,
                    width: 65,
                    child: InkWell(
                      splashColor: Colors.green,
                      onTap: ()  async {
                        await FlutterPhoneDirectCaller.callNumber('16263');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.contact_support,
                            size: 40,
                          ), // <-- Icon
                          Text("Health"), // <-- Text
                        ],
                      ),
                    ),
                  ),
                ),
                //SizedBox(width: 50),
                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.lightBlueAccent),
                    height: 65,
                    width: 65,
                    child: InkWell(
                      splashColor: Colors.blueAccent,
                      onTap: ()  async {
                        await FlutterPhoneDirectCaller.callNumber('333');
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.help_outline,
                            size: 40,
                          ), // <-- Icon
                          Text("HelpMate"), // <-- Text
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scalFactor);
      var currTranse = 200 * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTranse, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scalFactor + (_currPageValue - index + 1) * (1 - _scalFactor);
      var currTranse = 200 * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTranse, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scalFactor);
      var currTranse = 200 * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTranse, 0);
    } else {
      var currScale = 0.8;
      var currTranse = 200 * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTranse, 0);
    }
    //else if(){};
    return Transform(
      transform: matrix,
      child: Stack(children: [
        Container(
          height: 200,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.yellow,
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/amb.png"))),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 70,
            margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: index.isEven?const Color(0xFF69c5df):const Color(0xFF9294cc),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 5),
                      blurRadius: 10.0)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Call: 999",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
