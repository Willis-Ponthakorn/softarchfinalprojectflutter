import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PasswordFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  const PasswordFieldWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool _isVisible = true;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;
  bool _hasPasswordUpperCase = false;
  String errortext =
      "Password must have\nMore than 8 character long\nAt least 1 number\nAt least 1 uppercase letter";

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    final upperRegex = RegExp(r'[A-Z]');
    errortext = "Password must have\n";
    setState(() {
      _isPasswordEightCharacters = false;
      if (password.length >= 8)
        _isPasswordEightCharacters = true;
      else
        errortext += 'More than 8 character long\n';

      _hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password))
        _hasPasswordOneNumber = true;
      else
        errortext += 'At least 1 number\n';

      _hasPasswordUpperCase = false;
      if (upperRegex.hasMatch(password))
        _hasPasswordUpperCase = true;
      else
        errortext += 'At least 1 uppercase letter';
    });
  }

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: widget.controller,
        onChanged: (password) => onPasswordChanged(password),
        obscureText: _isVisible,
        decoration: InputDecoration(
            hintMaxLines: 4,
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
            hintText: 'Password',
            hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.black.withOpacity(0.2),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
              icon: _isVisible
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
            )),
        validator: (password) => password != null &&
                !_isPasswordEightCharacters &&
                !_hasPasswordOneNumber &&
                !_hasPasswordUpperCase
            ? errortext
            : null,
      );
}
