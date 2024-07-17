import 'package:flutter/material.dart';

class Vflow extends StatefulWidget {
  const Vflow({super.key});

  @override
  State<Vflow> createState() => _VflowState();
}

class _VflowState extends State<Vflow> {
  // Fixed the class name
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Ini vflow'),
      ),
    );
  }
}
