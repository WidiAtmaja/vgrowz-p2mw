import 'package:flutter/material.dart';
import 'package:vgrowz/utils/utils.dart';

class DrawerDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.secondary,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_vgrowz.png',
              height: 100,
              width: 100,
            ),
            SizedBox(height: 20), // Jarak antara logo dan teks
            Text('V-Growz', style: TextStyles.status2),
            SizedBox(height: 20), // Jarak antara teks dan logo kedua
            Image.asset(
              'assets/images/logo_p2mw.png',
              height: 200,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
