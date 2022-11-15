import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:softapp/widgets/multi_text_field.dart';
import 'package:softapp/widgets/navigation_drawer.dart';
import 'package:softapp/widgets/circle_button.dart';

import '../widgets/create_post_contrainer.dart';
import '../widgets/icbutton.dart';
import '../widgets/post_contrainer.dart';
import '../widgets/tag_button.dart';

class PostPage extends StatefulWidget {

  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    const double avatarDiameter = 70;
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: NavigateDrawer(),
      body: CustomScrollView(
        slivers: [
          //*************************************App Bar******************************** */
          SliverAppBar(
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
          //*********************************End App Bar************************************
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 206, 204, 204),
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(20),
                          child: GestureDetector(
                            onTap: () => print('หน้าผู้ใช้งาน'),
                            child: Container(
                              margin: EdgeInsets.fromLTRB(
                                  MediaQuery.of(context).size.height * 0.01,
                                  MediaQuery.of(context).size.height * 0.06,
                                  0,
                                  0),
                              width: avatarDiameter,
                              height: avatarDiameter,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(avatarDiameter / 2),
                                //ใส่รูป
                                child: Image(
                                  image: NetworkImage(
                                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () => print('หน้าผู้ใช้งาน'),
                              child: Container(
                                margin: EdgeInsets.fromLTRB(
                                    0,
                                    MediaQuery.of(context).size.height * 0.1,
                                    0,
                                    0),
                                child: Text(
                                  //ใส่ชื่อแต่ละคนโพสต์
                                  'Username',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  alignment: Alignment.centerLeft,
                                  height: 15,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: ListView.builder(
                                    itemCount: 8,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return TagButton(
                                        onPressed: () => print('tag'),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              child: MultilineTextField(),
            ),
          ),
        ],
      ),
    );
  }
}
