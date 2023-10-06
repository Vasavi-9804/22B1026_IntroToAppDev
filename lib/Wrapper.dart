import "package:assignment_2/Screens/authenticate/Authenticate.dart";
import "package:flutter/material.dart";

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
   //return either authenticate or home screens
    return Authenticate();
  }
}