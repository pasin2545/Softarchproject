import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.height * 1.0,
          child: _postsListView(context),
        ),
      ],
    );
  }

  Widget _postAuthorRow(BuildContext context) {
    const double avatarDiameter = 44;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width*0.95,
              color: Colors.green,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: avatarDiameter,
                      height: avatarDiameter,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(avatarDiameter / 2),
                        //ใส่รูป
                        child: Image(
                          image: NetworkImage('shorturl.at/bhFJO'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    //ใส่ชื่อแต่ละคนโพสต์
                    'Username',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _postView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_postAuthorRow(context)],
    );
  }

  Widget _postsListView(BuildContext context) {
    return ListView.separated(
      itemCount: 20,
      itemBuilder: (context, index) {
        return _postView(context);
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 10,
      ),
    );
  }
}


/*Row(
      children: [
        Padding(
          //padding: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child:  Container(
            //margin: const EdgeInsets.symmetric(vertical: 5.0),
            //padding: const EdgeInsets.symmetric(vertical: 8.0),
            width: avatarDiameter,
            height: avatarDiameter,
            //color: Color.fromARGB(255, 145, 141, 141),
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(avatarDiameter/2),
              //ใส่รูป
              child: Image(image: NetworkImage('shorturl.at/bhFJO'),fit: BoxFit.cover,),
            ),
          ),
          ),
        Text('Username',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        ),
      ],
    );*/