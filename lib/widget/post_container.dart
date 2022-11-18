import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:softarchfinal/widget/tag_button.dart';

class PostContainer extends StatefulWidget {
  //type = approve report admin user
  final String type;
  final Map post;
  const PostContainer({Key? key, required this.post, required this.type})
      : super(key: key);

  @override
  State<PostContainer> createState() => _PostContainer();
}

class _PostContainer extends State<PostContainer> {
  @override
  Widget build(BuildContext context) {
    const double avatarDiameter = 44;
    var now = DateTime.now();
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        alignment: Alignment.center,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
          elevation: 0,
          color: Color.fromRGBO(217, 217, 217, 1),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  //**************************avatar******************************
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
                          image: NetworkImage(widget.post['user_pic']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  //***************************************************************
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          //ใส่ชื่อแต่ละคนโพสต์
                          widget.post['username'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              //decoration: BoxDecoration(color: Colors.red),
                              alignment: Alignment.centerLeft,
                              height: 15,
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: ListView.builder(
                                itemCount: widget.post['tags'].length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return TagButton(
                                    onPressed: () => print('tag'),
                                    tags: widget.post['tags'][index],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (widget.type == 'user')
                    IconButton(
                        icon: FaIcon(FontAwesomeIcons.flag),
                        iconSize: 23.0,
                        onPressed: () => print("report")),
                  if (widget.type == 'admin')
                    IconButton(
                        icon: FaIcon(FontAwesomeIcons.trashCan),
                        iconSize: 23.0,
                        onPressed: () => print("report")),
                  if (widget.type == 'report')
                    IconButton(
                        icon: FaIcon(FontAwesomeIcons.xmark),
                        iconSize: 23.0,
                        onPressed: () => print("report")),
                ],
              ),
              _postCaption(context, widget.post['postText']),
              if (widget.post['attachedImageUrl'] != '')
                _postImage(context, widget.post['attachedImageUrl']),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
                          child: Text(
                            widget.post['post_date'],
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (widget.type == 'admin' || widget.type == 'user')
                    IconButton(
                        icon: FaIcon(FontAwesomeIcons.share),
                        iconSize: 23.0,
                        onPressed: () => print("share")),
                  if (widget.type == 'report')
                    Row(
                      children: [
                        Text(
                          'Report count : ' +
                              widget.post['report_count'].toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                            icon: FaIcon(FontAwesomeIcons.trashCan),
                            iconSize: 23.0,
                            onPressed: () => print("share")),
                      ],
                    ),
                  if (widget.type == 'approve')
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(12, 0, 12, 10),
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Ink(
                              decoration: ShapeDecoration(
                                color: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: IconButton(
                                  color: Colors.white,
                                  icon: FaIcon(FontAwesomeIcons.check),
                                  iconSize: 23.0,
                                  onPressed: () => print("share")),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 12, 10),
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Ink(
                              decoration: ShapeDecoration(
                                color: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: IconButton(
                                  color: Colors.white,
                                  icon: FaIcon(FontAwesomeIcons.xmark),
                                  iconSize: 23.0,
                                  onPressed: () => print("share")),
                            ),
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _postImage(BuildContext context, String image) {
  return Container(
    margin: EdgeInsets.fromLTRB(25, 5, 25, 5),
    child: Image(
      image: NetworkImage(image),
      fit: BoxFit.cover,
    ),
  );
}

Widget _postCaption(BuildContext context, String text_post) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 4,
    ),
    child: Text(
      text_post,
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  );
}
