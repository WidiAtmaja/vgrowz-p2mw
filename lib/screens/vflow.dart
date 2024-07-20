import 'package:flutter/material.dart';
import 'package:vgrowz/utils/utils.dart';

class Vflow extends StatefulWidget {
  const Vflow({super.key});

  @override
  State<Vflow> createState() => _VflowState();
}

class _VflowState extends State<Vflow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Container(
          height: 550,
          width: 370,
          decoration: BoxDecoration(
            color: AppColors.bgcard,
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
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 170,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 25, 110, 28),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'Aktif',
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
                    onPressed: () {},
                    child: Icon(
                      Icons.power_settings_new,
                      size: 90,
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.button,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(60)),
                  )),
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
                        SizedBox(
                          height: 10,
                        ),
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
