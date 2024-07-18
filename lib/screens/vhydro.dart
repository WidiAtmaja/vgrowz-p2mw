import 'package:flutter/material.dart';
import 'package:vgrowz/utils/utils.dart';

class Vhydro extends StatefulWidget {
  const Vhydro({super.key});

  @override
  State<Vhydro> createState() => _VhydroState();
}

class _VhydroState extends State<Vhydro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Text('Ini vhydro'),
      ),
    );
  }
}
