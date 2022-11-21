import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:softarchfinal/widget/circle_button.dart';
import 'package:softarchfinal/widget/navigation_drawer.dart';
import 'package:softarchfinal/widget/post_container.dart';

var now = DateTime.now();
bool tagstatus = false;
String tagtoppic = 'รักภูมิ';
//List taglist = ['รักภูมิ', 'ไอควาย'];
List posts = [
  {'postID': 0},
  {
    'postID': 1,
    'user_pic':
        'https://scontent.fbkk2-8.fna.fbcdn.net/v/t31.18172-8/27983318_927126334112348_3039290882612106297_o.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEJSKqBJw-NYpHLhniXxUaJWAX3VIQhaipYBfdUhCFqKiUnNtN-usrb1_VhxPCFS6WqQxm9QebFqsnh2xxOIP2J&_nc_ohc=FO6mJJc0WnwAX_CHgnT&_nc_ht=scontent.fbkk2-8.fna&oh=00_AfC7wOHDCa9NsrMLto1cGqlR31vhDHSV74XTWTd1S1uxbA&oe=639028DF',
    'username': 'Username',
    'user_verify': false,
    'postText':
        'F*ck youaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    'attachedImageUrl': 'https://dc.lnwfile.com/_/dc/_raw/u8/0p/0u.jpg',
    'tags': ['อยากซัดหน้าปัน'],
    'post_date':
        '${now.day}/${now.month}/${now.year}   ${now.hour.toString().padLeft(2, '0')}.${now.minute.toString().padLeft(2, '0')} น.'
  },
  {
    'postID': 2,
    'user_pic':
        'https://scontent.fbkk2-8.fna.fbcdn.net/v/t31.18172-8/27983318_927126334112348_3039290882612106297_o.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEJSKqBJw-NYpHLhniXxUaJWAX3VIQhaipYBfdUhCFqKiUnNtN-usrb1_VhxPCFS6WqQxm9QebFqsnh2xxOIP2J&_nc_ohc=FO6mJJc0WnwAX_CHgnT&_nc_ht=scontent.fbkk2-8.fna&oh=00_AfC7wOHDCa9NsrMLto1cGqlR31vhDHSV74XTWTd1S1uxbA&oe=639028DF',
    'username': '윤보미 Chaipanna',
    'user_verify': true,
    'postText':
        'ทำไมเด๋วนี้พี่คิงไม่ยอมให้หนูเล่นเกมด้วยเลยสนใจแต่อะไรก็ไม่รู้ รู้มั้ยว่าหนูคิดถึงพี่คิงขนาดไหน แล้วนี้เมื่อไหร่จะขอหนูเป็นแฟนหนูรอพี่คิงมาขอนานแล้วนะ งื้อๆ',
    'attachedImageUrl': '',
    'tags': ['สีชมพู', 'รักภูมิ', 'เด็กคิง'],
    'post_date':
        '${now.day}/${now.month}/${now.year}   ${now.hour.toString().padLeft(2, '0')}.${now.minute.toString().padLeft(2, '0')} น.'
  },
  {
    'postID': 3,
    'user_pic':
        'https://scontent.fbkk2-8.fna.fbcdn.net/v/t31.18172-8/27983318_927126334112348_3039290882612106297_o.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEJSKqBJw-NYpHLhniXxUaJWAX3VIQhaipYBfdUhCFqKiUnNtN-usrb1_VhxPCFS6WqQxm9QebFqsnh2xxOIP2J&_nc_ohc=FO6mJJc0WnwAX_CHgnT&_nc_ht=scontent.fbkk2-8.fna&oh=00_AfC7wOHDCa9NsrMLto1cGqlR31vhDHSV74XTWTd1S1uxbA&oe=639028DF',
    'username': '윤보미 Chaipanna',
    'user_verify': false,
    'postText':
        'ทำไมเด๋วนี้พี่คิงไม่ยอมให้หนูเล่นเกมด้วยเลยสนใจแต่อะไรก็ไม่รู้ รู้มั้ยว่าหนูคิดถึงพี่คิงขนาดไหน แล้วนี้เมื่อไหร่จะขอหนูเป็นแฟนหนูรอพี่คิงมาขอนานแล้วนะ งื้อๆ',
    'attachedImageUrl': '',
    'tags': ['สีชมพู', 'รักภูมิ', 'เด็กคิง'],
    'post_date':
        '${now.day}/${now.month}/${now.year}   ${now.hour.toString().padLeft(2, '0')}.${now.minute.toString().padLeft(2, '0')} น.'
  },
];

class TagDisplayScreen extends StatefulWidget {
  const TagDisplayScreen({Key? key}) : super(key: key);

  @override
  State<TagDisplayScreen> createState() => _TagDisplayScreenState();
}

class _TagDisplayScreenState extends State<TagDisplayScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    bool isAdmin = true;
    const double avatarDiameter = 70;
    return Scaffold(
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
            icon: FaIcon(FontAwesomeIcons.gripVertical),
            iconSize: 23.0,
            onPressed: _openEndDrawer,
          ),
        ],
      ),
      key: _scaffoldKey,
      endDrawer: AdminNavigateDrawer(),
      body: Container(
        color: Colors.black,
        child: ListView.separated(
          itemCount: posts.length,
          itemBuilder: (BuildContext context, int index) {
            final post = posts[index];
            if (index == 0)
              return Container(
                color: Color.fromRGBO(217, 217, 217, 1),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '#' + tagtoppic,
                        style: TextStyle(fontSize: 30),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (tagstatus)
                                setState(() => tagstatus = false);
                              else
                                setState(() => tagstatus = true);
                            },
                            child: Text(tagstatus ? 'ติดตามแล้ว' : 'ติดตาม'),
                            style: ElevatedButton.styleFrom(
                              shape: StadiumBorder(),
                              primary: tagstatus ? Colors.blue : Colors.orange,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(132, 131, 130, 100),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: FaIcon(FontAwesomeIcons.flag),
                              iconSize: 23,
                              color: Colors.black,
                              onPressed: () {
                                print('test');
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            //if (taglist.any((e) => post['tags'].contains(e)))
            if (post['tags'].contains(tagtoppic))
              return PostContainer(post: post, type: 'user');
            return Container();
          },
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
        ),
      ),
    );
    /*return Scaffold(
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
      key: _scaffoldKey,
      endDrawer: NavigateDrawer(),
      body: Column(
        children: [
          /*Container(
            color: Color.fromRGBO(217, 217, 217, 1),
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '#' + tagtoppic,
                    style: TextStyle(fontSize: 30),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (tagstatus)
                            setState(() => tagstatus = false);
                          else
                            setState(() => tagstatus = true);
                        },
                        child: Text(tagstatus ? 'ติดตามแล้ว' : 'ติดตาม'),
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: tagstatus ? Colors.blue : Colors.orange,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(132, 131, 130, 100),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: FaIcon(FontAwesomeIcons.flag),
                          iconSize: 23,
                          color: Colors.black,
                          onPressed: () {
                            print('test');
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),*/
          Container(
            color: Colors.black,
            child: ListView.separated(
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                final post = posts[index];
                return PostContainer(post: post, type: 'user');
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
            ),
          ),
        ],
      ),
    );
  */
  }
}
