import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:softapp/widgets/icbutton.dart';

class MultilineTextField extends StatefulWidget {
  const MultilineTextField({Key? key}) : super(key: key);

  @override
  State<MultilineTextField> createState() => _MultilineTextFieldState();
}

class _MultilineTextFieldState extends State<MultilineTextField> {
  final TextEditingController _Textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
        height: MediaQuery.of(context).size.width * 0.7,
        width: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 206, 204, 204),
        ),
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _Textcontroller,
              minLines: 10,
              maxLines: 12,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 139, 139, 139),
                  hintText: 'พิมพ์อะไรสักอย่างสิ...',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            )),
      ),
      Container(
        height: MediaQuery.of(context).size.width * 0.58,
        width: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(color: Colors.red),
      ),
      Container(
        height: MediaQuery.of(context).size.width * 0.165,
        width: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(color: Colors.green),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: IcButton(
                          icon: FaIcon(FontAwesomeIcons.image),
                          iconSize: 26,
                          onPressed: () => print('รูป'))),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _Textcontroller.notifyListeners();
                    });
                  },
                  child: Text(
                    'post',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 246, 183, 36),
                    elevation: 3,
                    shape: StadiumBorder(),
                  )),
            ),
          ],
        ),
      )
    ]));
  }
}
