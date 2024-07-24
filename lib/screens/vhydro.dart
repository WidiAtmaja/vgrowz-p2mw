import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vgrowz/utils/utils.dart';
import 'package:vgrowz/providers/mqtt_providers.dart';

class Vhydro extends StatelessWidget {
  const Vhydro({super.key});

  @override
  Widget build(BuildContext context) {
    final mqttProvider = Provider.of<MqttProvider>(context);

    return Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Container(
            height: 550,
            width: 370,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  child: Center(
                    child: Text(
                      'Kelembaban',
                      style: TextStyles.heading1,
                    ),
                  ),
                ),
                Container(
                    width: 280,
                    height: 120,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 13, 81, 79),
                        borderRadius: BorderRadius.circular(70),
                      ),
                      child: Center(
                        child: Text(
                          mqttProvider.soilMoisture,
                          style: TextStyles.lembab,
                        ),
                      ),
                    )),
                Container(
                  width: double.infinity,
                  height: 100,
                  child: Center(
                    child: Text(
                      'Kelembaban tanah hari ini',
                      style: TextStyles.body,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
