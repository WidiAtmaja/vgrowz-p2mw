import 'package:flutter/material.dart';

Color getColorForLightIntensity(String intensity) {
  int value = int.parse(intensity);
  if (value >= 1 && value <= 60) {
    return Colors.white;
  } else if (value > 60 && value <= 80) {
    return Colors.orange;
  } else if (value > 80 && value <= 100) {
    return Colors.red;
  } else {
    return Colors.white; // Default color if out of range
  }
}

String getMoistureDescription(String intensity) {
  int value = int.parse(intensity);
  if (value >= 1 && value <= 40) {
    return 'Normal';
  } else if (value > 40 && value <= 60) {
    return 'Sedang';
  } else if (value > 60 && value <= 80) {
    return 'Lembab';
  } else if (value > 80 && value <= 100) {
    return 'Sangat Lembab';
  } else {
    return 'Normal';
  }
}

Color getColorForMoisture(String intensity) {
  int value = int.parse(intensity);
  if (value >= 1 && value <= 40) {
    return Colors.green;
  } else if (value > 40 && value <= 60) {
    return Colors.orange;
  } else if (value > 60 && value <= 80) {
    return Colors.red;
  } else if (value > 80 && value <= 100) {
    return Color.fromARGB(255, 101, 12, 5);
  } else {
    return Colors.green;
  }
}
