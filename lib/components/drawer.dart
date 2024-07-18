import 'package:flutter/material.dart';
import 'package:vgrowz/utils/utils.dart';

class DrawerDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.drawer,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.secondary,
            ),
            child: Text(
              'V-Growz',
              style: TextStyles.heading1,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context); // Menutup drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context); // Menutup drawer
            },
          ),
        ],
      ),
    );
  }
}
