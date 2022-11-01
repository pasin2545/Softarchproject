import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class userdisplay extends StatelessWidget {
  const userdisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'KMITL',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: <Widget>[
                Text(
                  'NEWS',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 222, 105, 21),
        actions: <Widget>[
            IconButton(
              onPressed: () => print("กดกระดิ่ง"), 
              icon: FaIcon(FontAwesomeIcons.bell),
              ),
            IconButton(
              onPressed: () => print("กดสามปุ่ม"), 
              icon: FaIcon(FontAwesomeIcons.gripVertical),
              ),
        ],
      ),
    );
  }
}
