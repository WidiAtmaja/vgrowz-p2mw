import 'package:flutter/material.dart';

class Vlume extends StatefulWidget {
  const Vlume({super.key});

  @override
  State<Vlume> createState() => _VlumeState();
}

class _VlumeState extends State<Vlume> {
  // Fixed the class name
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Ini Vlume'),
      ),
    );
  }
}
