import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vgrowz/utils/utils.dart';
import 'package:vgrowz/providers/mqtt_providers.dart';

class Vflow extends StatelessWidget {
  const Vflow({super.key});

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
                          'Status',
                          style: TextStyle(
                              color: TextColor.secondary,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 15),
                        Container(
                          child: Center(
                            child: Text(
                              mqttProvider.isWateringActive
                                  ? 'Aktif'
                                  : 'Tidak Aktif',
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
                    child: ElevatedButton(
                      onPressed: mqttProvider.toggleWatering,
                      child: Icon(
                        Icons.power_settings_new,
                        size: 90,
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: mqttProvider.isWateringActive
                              ? Color.fromARGB(255, 25, 110, 28)
                              : Color.fromARGB(255, 158, 37, 29),
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(60)),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Klik Tombol Untuk \n Mengaktifkan Penyiraman',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: TextColor.secondary,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Jika diaktifkan maka penyiraman \n otomatis dilakukan',
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
