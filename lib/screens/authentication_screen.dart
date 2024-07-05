import 'package:qrental_mobile/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'main_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  String? _inputUserName;
  String? _inputUserPassword;
  bool _isUserEnteredInvalidData = false;
  bool _isUserNameEmpty = false;
  bool _isUserPasswordEmpty = false;

  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _userPasswordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _userNameFocusNode.addListener(() {
      if(_userNameFocusNode.hasFocus) {
        setState(() {
          _isUserNameEmpty = false;
        });
      }
      else {
        if(_inputUserName == null) {
          setState(() {
            _isUserNameEmpty = true;
          });
        }
      }
    });

    _userPasswordFocusNode.addListener(() {
      if(_userPasswordFocusNode.hasFocus) {
        setState(() {
          _isUserPasswordEmpty = false;
        });
      }
      else {
        if(_inputUserPassword == null) {
          setState(() {
            _isUserPasswordEmpty = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _userNameFocusNode.dispose();
    _userPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Login",
              style: TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.w600)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: TextField(
                focusNode: _userNameFocusNode,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none),
                    errorText: _isUserNameEmpty ? "You must enter a username" : null,
                    errorStyle: const TextStyle(
                        color: Color(0xFFFF2D2D),
                        fontWeight: FontWeight.w500
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: _isUserNameEmpty ? Colors.red : Colors.white),
                    ),
                    hintText: 'Username',
                    hintStyle: const TextStyle(color: Colors.grey),
                    iconColor: Colors.white,
                    icon: const Icon(Icons.person)),
                onChanged: (String text) {
                  setState(() {
                    _inputUserName = text;
                    _isUserNameEmpty = text.isEmpty;
                  });
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: TextField(
                focusNode: _userPasswordFocusNode,
                obscureText: true,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none),
                    errorText: _isUserPasswordEmpty ? "You must enter a password" : null,
                    errorStyle: const TextStyle(
                      color: Color(0xFFFF2D2D),
                      fontWeight: FontWeight.w500
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: _isUserPasswordEmpty ? Colors.red : Colors.white),
                    ),
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: Colors.grey),
                    iconColor: Colors.white,
                    icon: const Icon(Icons.key)),
                onChanged: (String text) {
                  setState(() {
                    _inputUserPassword = text;
                    _isUserPasswordEmpty = text.isEmpty;
                  });
                }),
          ),
          Visibility(
             visible: _isUserEnteredInvalidData,
             child: const Padding(
               padding: EdgeInsets.only(top: 5.0),
               child: Text(
                   "Invalid username or password",
                   style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500)
               ),
             )
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: ElevatedButton(
                onPressed: () async {
                  if (_inputUserName != userName || _inputUserPassword != userPassword) {

                    if(_inputUserName == null || _inputUserPassword == null) {
                      return;
                    }

                    setState(() {
                      _isUserEnteredInvalidData = true;
                    });

                    Future.delayed(const Duration(seconds: 5), () {
                      setState(() {
                        _isUserEnteredInvalidData = false;
                      });
                    });

                    return;
                  }

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MainScreen();
                  }));
                },
                child:
                    const Text("Sign in", style: TextStyle(color: Colors.white))),
          )
        ],
      ),
    ));
  }
}
