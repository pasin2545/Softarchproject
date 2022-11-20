import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:softapp/widgets/widgets.dart';

class NavigateDrawer extends StatelessWidget {
  const NavigateDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildHeader(context),
          buildMenuItems(context),
        ],
      )),
    );
  }

  Widget buildHeader(BuildContext context) => Container(
    decoration: BoxDecoration(color: Color.fromARGB(255, 222, 105, 21)),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(color: Color.fromARGB(255, 222, 105, 21)),
        child: Wrap(
          runSpacing: 16,
          children: [
            SizedBox(
              height: 800,
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) =>
                      GestureDetector(child: EntryItem(data[index]))),
            ),
          ],
        ),
      );
}

class Entry {
  final String ti;
  final List<Entry> children;
  final void Function()? onPressed;
  Entry(this.ti, this.onPressed, [this.children = const <Entry>[]]);
}

final List<Entry> data = <Entry>[
  Entry('Home', () {}),
  Entry('Foryou', () {}),
  Entry(
    'Tags',
    () {},
    <Entry>[
      Entry('Tags Search', () => print('dick')),
      Entry('Following Tags', () => print('sucker')),
    ],
  ),
  Entry('Profile', () {}),
  Entry('Request Verified', () {}),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);
  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: Text(root.ti,style: TextStyle(color: Colors.white,fontSize: 20),),
        onTap: root.onPressed,
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.ti,style: TextStyle(color: Colors.white,fontSize: 20),),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}