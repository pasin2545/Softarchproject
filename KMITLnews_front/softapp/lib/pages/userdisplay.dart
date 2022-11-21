import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:softapp/widgets/circle_button.dart';
import 'package:softapp/widgets/create_post_contrainer.dart';
import 'package:softapp/widgets/navigation_drawer.dart';
import 'package:softapp/widgets/post_contrainer.dart';

class userdisplay extends StatefulWidget {
  const userdisplay({Key? key}) : super(key: key);

  @override
  State<userdisplay> createState() => _userdisplayState();
}

class _userdisplayState extends State<userdisplay> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        endDrawer: NavigateDrawer(),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 222, 105, 21),
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
          actions: <Widget>[
            CircleButton(
                icon: FaIcon(FontAwesomeIcons.bell),
                iconSize: 23.0,
                onPressed: () => print('bell')),
            CircleButton(
              icon: FaIcon(FontAwesomeIcons.gripVertical),
              iconSize: 23.0,
              onPressed: _openEndDrawer,
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              child: CreatePostContrainer(
                image: NetworkImage('shorturl.at/cmtQ4'),
              ),
            ),
            Expanded(
              child: Container(
                child: PostContainer(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
