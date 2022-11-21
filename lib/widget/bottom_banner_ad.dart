import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomBannerAd extends StatefulWidget {
  const BottomBannerAd({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomBannerAdState();
}

class _BottomBannerAdState extends State<BottomBannerAd> {
  // Banner ads automatically show new ads after a certain period of time.
  // You do not need to do anything fancy with timers or resetting this variable.
  //final banner = GetIt.instance.get<AdService>().getBannerAd();

  @override
  void dispose() {
    super.dispose();
  }

  String ads =
      "https://scontent.fbkk2-8.fna.fbcdn.net/v/t1.6435-9/30441178_1708109815943486_3812504059043119104_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=ad2b24&_nc_eui2=AeG9iADga4oU8aZfSgydY1XDPiiv0fRh-_U-KK_R9GH79Rmx7Jvfx9bO5nqCGD4hliM5a5RQAyn4G3VNKP7p7CxS&_nc_ohc=-R7hR6YD7jwAX8q3Nxu&tn=zczj23AEyJI8ak6P&_nc_ht=scontent.fbkk2-8.fna&oh=00_AfBDtp0AuHSIu7CLujo980LOIdJoMhuLZL4FAQOa5rc6cw&oe=639035C4";
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(ads), fit: BoxFit.cover)),
      child: ListTile(
        onTap: _launchURL,
      ),
      //color: Colors.transparent,
      width: double.infinity,
      height: 50,
    );
  }

  _launchURL() async {
    const url = 'https://www.facebook.com/profile.php?id=100004449705370';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
