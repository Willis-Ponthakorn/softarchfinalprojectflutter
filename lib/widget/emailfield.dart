import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:email_validator/email_validator.dart';

class EmailFieldWidget extends StatefulWidget {
  final TextEditingController controller;

  const EmailFieldWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<EmailFieldWidget> createState() => _EmailFieldWidgetState();
}

class _EmailFieldWidgetState extends State<EmailFieldWidget> {
  @override
  Widget build(BuildContext context) => TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 1,
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 1,
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          contentPadding: EdgeInsets.only(left: 5),
          hintText: 'Email',
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.black.withOpacity(0.2),
            fontWeight: FontWeight.bold,
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (email) => email != null && !EmailValidator.validate(email)
            ? 'Email invaild.'
            : null,
      );
}
