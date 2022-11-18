import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TagButton extends StatefulWidget {
  final void Function()? onPressed;
  final String tags;

  const TagButton({super.key, this.onPressed, required this.tags});

  @override
  State<TagButton> createState() => _TagButton();
}

class _TagButton extends State<TagButton> {
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        child: Text(
          widget.tags,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          elevation: 3,
          shape: StadiumBorder(),
        ),
      ),
    );
  }
}
