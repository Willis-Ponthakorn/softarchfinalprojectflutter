import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:softarchfinal/screen/followingtag.dart';
import 'package:softarchfinal/screen/home.dart';
import 'package:softarchfinal/screen/postapprove.dart';
import 'package:softarchfinal/screen/postreport.dart';
import 'package:softarchfinal/screen/userprofilepage.dart';
import 'package:softarchfinal/screen/userreport.dart';
import 'package:softarchfinal/screen/userverified.dart';

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
              child: drawerItem(context),
            ),
          ],
        ),
      );

  Widget drawerItem(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          leading: Icon(
            Icons.arrow_right,
            size: 30,
          ),
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.arrow_right,
            size: 30,
          ),
          title: const Text(
            'For you',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ExpansionTile(
          title: Text(
            "Tags",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          leading: Icon(
            Icons.arrow_right,
            size: 30,
          ), //add icon
          childrenPadding: EdgeInsets.only(left: 15), //children padding
          children: [
            ListTile(
              leading: Icon(
                Icons.arrow_right,
                size: 30,
              ),
              title: Text(
                "Tags search",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                //action on press
              },
            ),

            ListTile(
              leading: Icon(
                Icons.arrow_right,
                size: 30,
              ),
              title: Text(
                "Following tags",
                style: TextStyle(color: Colors.white, fontSize: 20),
                maxLines: 1,
              ),
              onTap: () {
                //action on press
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FollowingTagScreen();
                }));
              },
            ),

            //more child menu
          ],
        ),
        ListTile(
          leading: Icon(
            Icons.arrow_right,
            size: 30,
          ),
          title: const Text(
            'Profile',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return UserProfilePage();
            }));
          },
        ),
        ListTile(
          leading: Icon(
            Icons.arrow_right,
            size: 30,
          ),
          title: const Text(
            'Req. Verified',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

class AdminNavigateDrawer extends StatelessWidget {
  const AdminNavigateDrawer({Key? key}) : super(key: key);

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
              child: drawerItem(context),
            ),
          ],
        ),
      );

  Widget drawerItem(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          leading: Icon(
            Icons.arrow_right,
            size: 30,
          ),
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.arrow_right,
            size: 30,
          ),
          title: const Text(
            'For you',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ExpansionTile(
          title: Text(
            "Tags",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          leading: Icon(
            Icons.arrow_right,
            size: 30,
          ), //add icon
          childrenPadding: EdgeInsets.only(left: 15), //children padding
          children: [
            ListTile(
              leading: Icon(
                Icons.arrow_right,
                size: 30,
              ),
              title: Text(
                "Tags search",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                //action on press
              },
            ),

            ListTile(
              leading: Icon(
                Icons.arrow_right,
                size: 30,
              ),
              title: Text(
                "Following tags",
                style: TextStyle(color: Colors.white, fontSize: 20),
                maxLines: 1,
              ),
              onTap: () {
                //action on press
              },
            ),

            //more child menu
          ],
        ),
        ListTile(
          leading: Icon(
            Icons.arrow_right,
            size: 30,
          ),
          title: const Text(
            'Profile',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return UserProfilePage();
            }));
          },
        ),
        ExpansionTile(
          title: Text(
            "Admin Panel",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          leading: Icon(
            Icons.arrow_right,
            size: 30,
          ), //add icon
          childrenPadding: EdgeInsets.only(left: 15), //children padding
          children: [
            ListTile(
              leading: Icon(
                Icons.arrow_right,
                size: 30,
              ),
              title: Text(
                "Post Approve",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onTap: () {
                //action on press
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AdminPostApproveScreen();
                }));
              },
            ),

            ListTile(
              leading: Icon(
                Icons.arrow_right,
                size: 30,
              ),
              title: Text(
                "Post Report",
                style: TextStyle(color: Colors.white, fontSize: 20),
                maxLines: 1,
              ),
              onTap: () {
                //action on press
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AdminPostReportScreen();
                }));
              },
            ),

            ListTile(
              leading: Icon(
                Icons.arrow_right,
                size: 30,
              ),
              title: Text(
                "User Verified",
                style: TextStyle(color: Colors.white, fontSize: 20),
                maxLines: 1,
              ),
              onTap: () {
                //action on press
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UserVerifiedScreen();
                }));
              },
            ),
            //more child menu
            ListTile(
              leading: Icon(
                Icons.arrow_right,
                size: 30,
              ),
              title: Text(
                "User Report",
                style: TextStyle(color: Colors.white, fontSize: 20),
                maxLines: 1,
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UserReportScreen();
                }));
              },
            ),
          ],
        ),
        ListTile(
          trailing: Icon(
            Icons.logout,
            size: 30,
            color: Colors.white,
          ),
          title: Text(
            "Logout",
            style: TextStyle(color: Colors.white, fontSize: 20),
            maxLines: 1,
          ),
          onTap: () {
            //action on press
          },
        ),
      ],
    );
  }
}
