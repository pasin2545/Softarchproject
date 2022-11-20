import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:softapp/widgets/multi_text_field.dart';
import 'package:softapp/widgets/navigation_drawer.dart';
import 'package:softapp/widgets/circle_button.dart';
import 'package:textfield_search/textfield_search.dart';

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
  TextEditingController myController = TextEditingController();
  String text = '';
  String name = '';
  List<String> _list = [];
  List<String> _taglist = [];


  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  @override
  void initState(){
    super.initState();

    myController = TextEditingController();
  }
  
  Future<List> fetchdata() async {
    _list.add('กบ' + 'กำกวม');
    _list.add('test' + 'Item 2');
    _list.add('test' + 'Item 3');
    return _list;
  }

  void dispose() {
    myController.dispose();
    super.dispose();
  }

  Future<String?> _showAddTag(BuildContext context) {
    TextEditingController myController = TextEditingController();

    return showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Tags Search'),
            content: Container(
              height: MediaQuery.of(context).size.width * 1,
              width: MediaQuery.of(context).size.width * 1,
              child: Form(
                  child: ListView(
                children: <Widget>[
                  TextFieldSearch(
                      label: 'Simple Future List',
                      controller: myController,
                      minStringLength: 1,
                      future: () {
                        return fetchdata();
                      }),
                ],
              )),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: (() => Navigator.pop(context, 'Cancel')),
                  child: const Text('Cancel')),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(myController.text);
                  if (_list.any((element) => myController.text != element)){
                    _list.add(myController.text);
                    _taglist.add(myController.text);
                    }
                  myController.clear();
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
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
                                  child: IconButton(
                                      onPressed: () async{ final name = await _showAddTag(context);
                                        if(name == null || name.isEmpty)return;
                                        setState((() => this.name= name));
                                      },
                                      icon: FaIcon(FontAwesomeIcons.plus)),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                              height: 15,
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: ListView.builder(
                                itemCount: _taglist.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return TagButton(
                                    onPressed: () => print('tag'),
                                    tags: _taglist[index],
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

class SearchTextField extends StatelessWidget {
  final TextEditingController myController;
  final ValueChanged<String> fieldValue;
  const SearchTextField(
      {Key? key, required this.myController, required this.fieldValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: CupertinoSearchTextField(
        controller: myController,
        onChanged: (String value) {
          fieldValue('$value');
        },
      ),
    );
  }

}
