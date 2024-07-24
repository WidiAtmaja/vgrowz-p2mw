import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vgrowz/utils/utils.dart';
import 'package:vgrowz/providers/mqtt_providers.dart';

class Vlume extends StatelessWidget {
  const Vlume({super.key});

  @override
  Widget build(BuildContext context) {
    final mqttProvider = Provider.of<MqttProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Container(
          height: 550,
          width: 370,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(
              children: [
                Flexible(
                  flex: 2,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Intensitas Matahari',
                          style: TextStyle(
                              color: TextColor.secondary,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 15),
                        Container(
                          width: 170,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 13, 81, 79),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              mqttProvider
                                  .lightIntensity, // Use lightIntensity property
                              style: TextStyles.status,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                    flex: 4,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              context.read<MqttProvider>().upLume();
                            },
                            child: Icon(
                              Icons.arrow_upward,
                              size: 70,
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.button,
                                padding: EdgeInsets.all(15),
                                minimumSize: Size(170, 70),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          SizedBox(height: 10), // Space between the two buttons
                          ElevatedButton(
                            onPressed: () {
                              context.read<MqttProvider>().downLume();
                            },
                            child: Icon(
                              Icons.arrow_downward,
                              size: 70,
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.button,
                                padding: EdgeInsets.all(15),
                                minimumSize: Size(170, 70),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                        ],
                      ),
                    )),
                Flexible(
                  flex: 2,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Klik Tombol Untuk \n Mengaktifkan Paranet',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: TextColor.secondary,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Jika diaktifkan maka paranet \n otomatis dilakukan',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(184, 216, 216, 216),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
