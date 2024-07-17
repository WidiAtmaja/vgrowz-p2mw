import 'package:flutter/foundation.dart';

class WaterFlowProvider with ChangeNotifier {
  bool _isWaterOn = false;

  bool get isWaterOn => _isWaterOn;

  void toggleWaterFlow() {
    _isWaterOn = !_isWaterOn;
    notifyListeners();
  }
}
