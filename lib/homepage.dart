import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
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
  late MqttServerClient client;
  final broker = '35d77ed3f8b849669b3a64e6626d0b43.s1.eu.hivemq.cloud';
  final port = 8883;
  final username = 'vgrowz-esp1';
  final passwd = 'ESP1vgrowz';

  final soil_moisture_topic = 'vgrowz/soil_moisture';
  final light_intensity_topic = 'vgrowz/light_intensity';
  final control_topic = 'vgrowz/control';
  final control_topic2 = 'vgrowz/control2';

  @override
  void initState() {
    super.initState();
    setupMqttClient();
  }

  void setupMqttClient() async {
    client = MqttServerClient(broker, '');
    client.port = port;
    client.secure = true;
    client.logging(on: true);
    client.keepAlivePeriod = 20;
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onSubscribed = onSubscribed;

    final connMessage = MqttConnectMessage()
        .withWillTopic('willtopic')
        .withWillMessage('My Will message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);
    client.connectionMessage = connMessage;

    try {
      await client.connect(username, passwd);
    } on Exception catch (e) {
      print('EXCEPTION: $e');
      client.disconnect();
    }
  }

  void onConnected() {
    print('Connected');
    client.subscribe(soil_moisture_topic, MqttQos.exactlyOnce);
    client.subscribe(light_intensity_topic, MqttQos.exactlyOnce);
    client.subscribe(control_topic, MqttQos.exactlyOnce);
    client.subscribe(control_topic2, MqttQos.exactlyOnce);
  }

  void onDisconnected() {
    print('Disconnected');
  }

  void onSubscribed(String topic) {
    print('Subscribed to $topic');
  }

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
