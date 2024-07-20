import 'package:flutter/material.dart';
import 'package:vgrowz/components/drawer.dart';
import 'package:vgrowz/utils/utils.dart';
import 'screens/vflow.dart';
import 'screens/vhydro.dart';
import 'screens/vlume.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;
  List<Widget> _screens = [
    Vlume(),
    Vflow(),
    Vhydro(),
  ];

  List<String> _appBarTitles = [
    'V-Lume',
    'V-Flow',
    'V-Hydro',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        iconTheme: IconThemeData(size: 40, color: AppColors.drawerIcon),
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            'assets/images/logo_vgrowz_putih.png',
            height: 20,
            width: 20,
          ),
        ),
        title: Text(
          _appBarTitles[_currentIndex],
          style: TextStyles.heading1,
        ),
      ),
      endDrawer: DrawerDetail(),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        iconSize: 30.0, // ukuran ikon
        selectedFontSize: 16.0, // ukuran font label yang dipilih
        unselectedFontSize: 14.0,
        backgroundColor: AppColors.tertiary,
        selectedItemColor: AppColors.white,
        unselectedItemColor:
            IconColors.primary, // ukuran font label yang tidak dipilih
        items: const [
          BottomNavigationBarItem(
            label: 'V-Lume',
            icon: Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Icon(Icons.brightness_7_rounded),
            ),
          ),
          BottomNavigationBarItem(
            label: 'V-Flow',
            icon: Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Icon(Icons.water_drop),
            ),
          ),
          BottomNavigationBarItem(
            label: 'V-Hydro',
            icon: Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Icon(Icons.water_sharp),
            ),
          ),
        ],
      ),
    );
  }
}
