import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:softarchfinal/widget/circle_button.dart';
import 'package:softarchfinal/widget/navigation_drawer.dart';
import 'package:softarchfinal/widget/profile_container.dart';

var now = DateTime.now();
List profiles = [
  {'profileID': 0},
  {
    'profileID': 1,
    'user_pic':
        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
    'username': 'Username',
    'first_name': 'Prayat',
    'last_name': 'Junochut',
    'email': 'prayat69.j@kmitl.ac.th',
    'mobile_number': '099-456-7856',
    'report_count': 999,
  },
  {
    'profileID': 2,
    'user_pic':
        'https://cdn.discordapp.com/avatars/695875199291228181/ff8949df85c202c508357c7a0bb1acd6.webp?size=80',
    'username': '윤보미 Chaipanna',
    'first_name': '윤보미',
    'last_name': 'Chaipanna',
    'email': 'KingRukDek99@kmitl.ac.th',
    'mobile_number': '082-368-6056',
    'report_count': 2,
  },
  {
    'profileID': 3,
    'user_pic':
        'https://cdn.discordapp.com/avatars/695875199291228181/ff8949df85c202c508357c7a0bb1acd6.webp?size=80',
    'username': '윤보미 Chaipanna',
    'first_name': '윤보미',
    'last_name': 'Chaipanna',
    'email': 'KingRukDek99@kmitl.ac.th',
    'mobile_number': '082-368-6056',
    'report_count': 6,
  },
];

class UserReportScreen extends StatefulWidget {
  const UserReportScreen({Key? key}) : super(key: key);

  @override
  State<UserReportScreen> createState() => _UserReportScreenState();
}

class _UserReportScreenState extends State<UserReportScreen> {
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
          itemCount: profiles.length,
          itemBuilder: (BuildContext context, int index) {
            final profile = profiles[index];
            if (index == 0)
              return Container(
                padding: EdgeInsets.fromLTRB(20, 12, 0, 0),
                height: 24,
                child: Text(
                  'Admin - User Report Review',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            return ProfileContainer(profile: profile, type: 'report');
          },
          separatorBuilder: (context, index) => SizedBox(
            height: 10,
          ),
        ),
      ),
    );
  }
}
