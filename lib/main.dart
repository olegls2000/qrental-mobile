import 'package:flutter/material.dart';
import 'package:qrental_mobile/screens/authentication_screen.dart';

void main() => runApp(const EntryPoint());

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const AuthenticationScreen(),
    );
  }
}