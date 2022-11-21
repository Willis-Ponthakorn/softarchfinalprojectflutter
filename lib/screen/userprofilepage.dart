import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:softarchfinal/screen/editprofilepage.dart';
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
        'https://scontent.fbkk2-8.fna.fbcdn.net/v/t31.18172-8/27983318_927126334112348_3039290882612106297_o.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEJSKqBJw-NYpHLhniXxUaJWAX3VIQhaipYBfdUhCFqKiUnNtN-usrb1_VhxPCFS6WqQxm9QebFqsnh2xxOIP2J&_nc_ohc=FO6mJJc0WnwAX_CHgnT&_nc_ht=scontent.fbkk2-8.fna&oh=00_AfC7wOHDCa9NsrMLto1cGqlR31vhDHSV74XTWTd1S1uxbA&oe=639028DF',
    'username': 'Thanapum Chaipanna',
    'postText': 'ไอปัน มึงเจอกู๊ว!!!!!!!!!',
    'attachedImageUrl': '',
    'tags': ['อยากซัดหน้าปัน'],
    'post_date':
        '${now.day}/${now.month}/${now.year}   ${now.hour.toString().padLeft(2, '0')}.${now.minute.toString().padLeft(2, '0')} น.'
  },
  {
    'postID': 2,
    'user_pic':
        'https://scontent.fbkk2-8.fna.fbcdn.net/v/t31.18172-8/27983318_927126334112348_3039290882612106297_o.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEJSKqBJw-NYpHLhniXxUaJWAX3VIQhaipYBfdUhCFqKiUnNtN-usrb1_VhxPCFS6WqQxm9QebFqsnh2xxOIP2J&_nc_ohc=FO6mJJc0WnwAX_CHgnT&_nc_ht=scontent.fbkk2-8.fna&oh=00_AfC7wOHDCa9NsrMLto1cGqlR31vhDHSV74XTWTd1S1uxbA&oe=639028DF',
    'username': 'Thanapum Chaipanna',
    'postText': 'ไอปัน มึงเจอกู๊ว!!!!!!!!!',
    'attachedImageUrl': '',
    'tags': ['อยากซัดหน้าปัน'],
    'post_date':
        '${now.day}/${now.month}/${now.year}   ${now.hour.toString().padLeft(2, '0')}.${now.minute.toString().padLeft(2, '0')} น.'
  },
  {
    'postID': 3,
    'user_pic':
        'https://cdn.discordapp.com/avatars/695875199291228181/ff8949df85c202c508357c7a0bb1acd6.webp?size=80',
    'username': 'Thanapum Chaipanna',
    'postText': 'ไอปัน มึงเจอกู๊ว!!!!!!!!!',
    'attachedImageUrl': '',
    'tags': ['อยากซัดหน้าปัน'],
    'post_date':
        '${now.day}/${now.month}/${now.year}   ${now.hour.toString().padLeft(2, '0')}.${now.minute.toString().padLeft(2, '0')} น.'
  },
];

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);
  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  String avatarURL1 =
      "https://i.pinimg.com/originals/d1/1e/20/d11e20d44501e1a59439b5344e07f5d7.jpg";
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: NavigateDrawer(),
      bottomNavigationBar: BottomBannerAd(),
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 222, 105, 21),
        elevation: 0.0,
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
              onPressed: () => print('bell')),*/
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
              backgroundImage: NetworkImage(avatarURL1),
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Thanapum Chaipunna",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                IconButton(
                    icon: FaIcon(FontAwesomeIcons.pen),
                    iconSize: 20,
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return EditProfilepage();
                      }));
                    }),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                color: Colors.red,
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
                  return PostContainer(post: post, type: 'owner');
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
