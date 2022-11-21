import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:softarchfinal/widget/navigation_drawer.dart';
import 'package:softarchfinal/widget/circle_button.dart';
import 'package:softarchfinal/widget/post_container.dart';
import 'package:softarchfinal/widget/bottom_banner_ad.dart';

var now = DateTime.now();
List posts = [
  {'postID': 0},
  {
    'postID': 1,
    'user_pic':
        'https://cdn.discordapp.com/avatars/695875199291228181/ff8949df85c202c508357c7a0bb1acd6.webp?size=80',
    'username': '윤보미 Chaipanna',
    'postText':
        'ทำไมเด๋วนี้พี่คิงไม่ยอมให้หนูเล่นเกมด้วยเลยสนใจแต่อะไรก็ไม่รู้ รู้มั้ยว่าหนูคิดถึงพี่คิงขนาดไหน แล้วนี้เมื่อไหร่จะขอหนูเป็นแฟนหนูรอพี่คิงมาขอนานแล้วนะ งื้อๆ',
    'attachedImageUrl': '',
    'tags': ['สีชมพู', 'รักภูมิ', 'เด็กคิง'],
    'post_date':
        '${now.day}/${now.month}/${now.year}   ${now.hour.toString().padLeft(2, '0')}.${now.minute.toString().padLeft(2, '0')} น.'
  },
  {
    'postID': 2,
    'user_pic':
        'https://cdn.discordapp.com/avatars/695875199291228181/ff8949df85c202c508357c7a0bb1acd6.webp?size=80',
    'username': '윤보미 Chaipanna',
    'postText':
        'ทำไมเด๋วนี้พี่คิงไม่ยอมให้หนูเล่นเกมด้วยเลยสนใจแต่อะไรก็ไม่รู้ รู้มั้ยว่าหนูคิดถึงพี่คิงขนาดไหน แล้วนี้เมื่อไหร่จะขอหนูเป็นแฟนหนูรอพี่คิงมาขอนานแล้วนะ งื้อๆ',
    'attachedImageUrl': '',
    'tags': ['สีชมพู', 'รักภูมิ', 'เด็กคิง'],
    'post_date':
        '${now.day}/${now.month}/${now.year}   ${now.hour.toString().padLeft(2, '0')}.${now.minute.toString().padLeft(2, '0')} น.'
  },
];

class OthersProfilePage extends StatefulWidget {
  _OthersProfilePage createState() => _OthersProfilePage();
}

class _OthersProfilePage extends State<OthersProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  bool follow = false;
  String avatarURL =
      "https://cdn.discordapp.com/avatars/695875199291228181/ff8949df85c202c508357c7a0bb1acd6.webp?size=80";
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: NavigateDrawer(),
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomBannerAd(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 222, 105, 21),
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'KMITL',
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
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
        ]),
        actions: <Widget>[
          /*CircleButton(
              icon: FaIcon(FontAwesomeIcons.bell),
              iconSize: 23.0,
              onPressed: showBanner),*/
          CircleButton(
            icon: FaIcon(FontAwesomeIcons.gripVertical),
            iconSize: 23.0,
            onPressed: _openEndDrawer,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.0,
            ),
            CircleAvatar(
              radius: 56,
              backgroundImage: NetworkImage(avatarURL),
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "윤보미 Chaipanna",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (follow)
                      setState(() => follow = false);
                    else
                      setState(() => follow = true);
                    print("Follow");
                  },
                  child: AnimatedContainer(
                    alignment: Alignment.center,
                    duration: Duration(milliseconds: 300),
                    height: 35,
                    width: 200,
                    decoration: BoxDecoration(
                        color: follow ? Colors.orange : Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: follow
                                ? Colors.transparent
                                : Colors.grey.shade100)),
                    child: Center(
                      child: Text(
                        follow ? "Following" : "Follow",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  alignment: Alignment.centerRight,
                  icon: FaIcon(FontAwesomeIcons.flag),
                  iconSize: 20,
                  color: Colors.orange,
                  onPressed: () {
                    print("Report ur mom");
                  },
                ),
              ],
            ),
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                color: Colors.orange,
                height: 18.0,
                thickness: 0.5,
              ),
            ),
            Container(
              color: Colors.black,
              child: ListView.separated(
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  final post = posts[index];
                  if (index == 0) return Container();
                  return PostContainer(post: post, type: 'user');
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
