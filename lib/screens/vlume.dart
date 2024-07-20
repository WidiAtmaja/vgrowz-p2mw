import 'package:flutter/material.dart';
import 'package:vgrowz/utils/utils.dart';

class Vlume extends StatefulWidget {
  const Vlume({super.key});

  @override
  State<Vlume> createState() => _VlumeState();
}

class _VlumeState extends State<Vlume> {
  // Fixed the class name
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
                          'Intensitas Matahari',
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
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 13, 81, 79),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              '229',
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
                            onPressed: () {},
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
                            onPressed: () {},
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
                        SizedBox(
                          height: 10,
                        ),
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
