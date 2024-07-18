import 'package:flutter/material.dart';
import 'package:vgrowz/components/drawer.dart';
import 'screens/vflow.dart';
import 'screens/vhydro.dart';
import 'screens/vlume.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _curentIndex = 0;
  List<Widget> body = const [
    Vlume(),
    Vflow(),
    Vhydro(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('V-Growz'),
      ),
      drawer: DrawerDetail(),
      body: Center(
        child: body[_curentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curentIndex,
        onTap: (int newIndex) {
          setState(() {
            _curentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(label: 'V-Lume', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'V-Flow', icon: Icon(Icons.menu)),
          BottomNavigationBarItem(label: 'V-Hydro', icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
