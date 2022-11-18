import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:softarchfinal/screen/home.dart';
import 'package:softarchfinal/screen/login.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:snippet_coder_utils/list_helper.dart';
import 'package:snippet_coder_utils/multi_images_utils.dart';
import 'package:softarchfinal/widget/emailfield.dart';
import 'package:softarchfinal/widget/passwordfield.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool _isVisible = true;
  String testText = "";
  String firstName = '';
  String lastName = '';
  String email = '';
  String mobileNum = '';
  String password = '';
  String conPassword = '';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        title: Text('Register'),
        backgroundColor: Colors.black,
      ),
      body: Form(
        key: globalKey,
        child: Column(children: [
          SizedBox(
            height: 24,
          ),
          SizedBox(
            height: 50,
            child: FormHelper.inputFieldWidget(
              context,
              "firstname",
              "First Name",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'First name can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {
                this.firstName = onSavedVal.toString().trim(),
              },
              initialValue: this.testText,
              obscureText: false,
              borderFocusColor: Colors.black,
              prefixIconColor: Theme.of(context).primaryColor,
              borderColor: Colors.black.withOpacity(0.2),
              borderRadius: 8,
              borderWidth: 1,
              focusedBorderWidth: 1,
              hintColor: Colors.black.withOpacity(0.2),
              fontSize: 14,
              hintFontSize: 14,
              paddingLeft: 35,
              paddingRight: 35,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 50,
            child: FormHelper.inputFieldWidget(
              context,
              "lastname",
              "Last Name",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Last name can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {
                this.lastName = onSavedVal.toString().trim(),
              },
              initialValue: this.testText,
              obscureText: false,
              borderFocusColor: Colors.black,
              prefixIconColor: Theme.of(context).primaryColor,
              borderColor: Colors.black.withOpacity(0.2),
              borderRadius: 8,
              borderWidth: 1,
              focusedBorderWidth: 1,
              hintColor: Colors.black.withOpacity(0.2),
              fontSize: 14,
              hintFontSize: 14,
              paddingLeft: 35,
              paddingRight: 35,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(35, 0, 35, 0),
            child: SizedBox(
              height: 50,
              child: EmailFieldWidget(controller: emailController),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 50,
            child: FormHelper.inputFieldWidget(
              context,
              "mobilenumber",
              "Mobile Number",
              (onValidateVal) {
                if (onValidateVal.isEmpty ||
                    mobileNum.length == 10 &&
                        !RegExp(r'[0-9]').hasMatch(mobileNum)) {
                  return 'Mobile number can\'t be empty or must has 10 digits.';
                }

                return null;
              },
              (onSavedVal) => {
                this.mobileNum = onSavedVal.toString().trim(),
              },
              initialValue: this.testText,
              obscureText: false,
              borderFocusColor: Colors.black,
              prefixIconColor: Theme.of(context).primaryColor,
              borderColor: Colors.black.withOpacity(0.2),
              borderRadius: 8,
              borderWidth: 1,
              focusedBorderWidth: 1,
              hintColor: Colors.black.withOpacity(0.2),
              fontSize: 14,
              hintFontSize: 14,
              paddingLeft: 35,
              paddingRight: 35,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(35, 12, 35, 0),
            child: PasswordFieldWidget(controller: passwordController),
          ),
          SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 50,
            child: FormHelper.inputFieldWidget(
              context,
              "conpassword",
              "Confirm Password",
              (onValidateVal) {
                if (onValidateVal.isEmpty || conPassword != password) {
                  return 'This must not be empty or must be same as password.';
                }

                return null;
              },
              (onSavedVal) => {
                this.conPassword = onSavedVal.toString().trim(),
              },
              initialValue: this.testText,
              obscureText: _isVisible,
              borderFocusColor: Colors.black,
              prefixIconColor: Theme.of(context).primaryColor,
              borderColor: Colors.black.withOpacity(0.2),
              borderRadius: 8,
              borderWidth: 1,
              focusedBorderWidth: 1,
              hintColor: Colors.black.withOpacity(0.2),
              fontSize: 14,
              hintFontSize: 14,
              paddingLeft: 35,
              paddingRight: 35,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isVisible = !_isVisible;
                  });
                },
                icon: _isVisible
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              ),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              fixedSize: const Size(256, 34),
              primary: const Color.fromRGBO(76, 77, 79, 1), // background
              onPrimary: Colors.white, // foreground
            ),
            onPressed: () {
              if (validateAndSave()) {
                print("First Name: $firstName");
                print("Last Name: $lastName");
                print("Email: $email");
                print("Mobile Number: $mobileNum");
                print("Password: $password");
                print("Confirm Password: $conPassword");
              }
            },
            child: const Text(
              'Continue',
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextButton(
            child: Text(
              'Term & Privacy Policy',
              style: TextStyle(
                  color: Color.fromRGBO(79, 175, 244, 1), fontSize: 12),
            ),
            onPressed: () {},
          ),
        ]),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      email = emailController.text;
      password = passwordController.text;
      form.save();
      return true;
    } else {
      return false;
    }
  }
}
