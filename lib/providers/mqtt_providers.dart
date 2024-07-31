import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttProvider with ChangeNotifier {
  late MqttServerClient client;
  final broker = '35d77ed3f8b849669b3a64e6626d0b43.s1.eu.hivemq.cloud';
  final port = 8883;
  final username = 'vgrowz-esp1';
  final passwd = 'ESP1vgrowz';

  final controlTopic = 'vgrowz/control';
  final controlTopic2 = 'vgrowz/control2';
  final soil_moisture_topic = 'vgrowz/soil_moisture';
  final light_intensity_topic = 'vgrowz/light_intensity';
  final automatic = 'vgrowz/automode';

  bool isConnected = false;
  bool isUpLume = false;
  bool isDownLume = false;
  bool isWateringActive = false;
  bool isAutomatic = false;

  String lightIntensity = '0';
  String soilMoisture = '0';

  MqttProvider() {
    setupMqttClient();
  }

  Future<void> setupMqttClient() async {
    client = MqttServerClient(broker, '');
    client.port = port;
    client.secure = true;
    client.logging(on: true);
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onSubscribed = onSubscribed;

    final connMessage = MqttConnectMessage()
        .withClientIdentifier('flutter_client')
        .withWillTopic('willtopic')
        .withWillMessage('My Will Message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);
    client.connectionMessage = connMessage;

    try {
      await client.connect(username, passwd);
      client.subscribe(controlTopic, MqttQos.exactlyOnce);
      client.subscribe(controlTopic2, MqttQos.exactlyOnce);
      client.subscribe(light_intensity_topic, MqttQos.exactlyOnce);
      client.subscribe(soil_moisture_topic, MqttQos.exactlyOnce);
      client.subscribe(automatic, MqttQos.exactlyOnce);
    } on Exception catch (e) {
      print('EXCEPTION: $e');
      client.disconnect();
    }

    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final MqttPublishMessage recMess = c![0].payload as MqttPublishMessage;
      final String pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      print(
          'Received message: $pt on topic: ${c[0].topic}'); // Log received message

      if (c[0].topic == light_intensity_topic) {
        lightIntensity = pt;
        print('Updated lightIntensity: $lightIntensity'); // Log for debugging
        notifyListeners();
      } else if (c[0].topic == soil_moisture_topic) {
        soilMoisture = pt;
        print('Updated soilMoisture: $soilMoisture'); // Log for debugging
        notifyListeners();
      }
    });
  }

  void onConnected() {
    isConnected = true;
    client.subscribe(controlTopic, MqttQos.exactlyOnce);
    client.subscribe(controlTopic2, MqttQos.exactlyOnce);
    client.subscribe(light_intensity_topic, MqttQos.exactlyOnce);
    client.subscribe(soil_moisture_topic, MqttQos.exactlyOnce);
    client.subscribe(automatic, MqttQos.exactlyOnce);

    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      for (var message in c!) {
        final MqttPublishMessage recMess =
            message.payload as MqttPublishMessage;
        final String pt =
            MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

        if (message.topic == light_intensity_topic) {
          lightIntensity = pt;
        } else if (message.topic == soil_moisture_topic) {
          soilMoisture = pt;
        } else if (message.topic == controlTopic2) {
          isWateringActive = pt == '1';
        } else if (message.topic == controlTopic) {
          isUpLume = pt == '1';
          isDownLume = pt == '0';
        } else if (message.topic == automatic) {
          isAutomatic = pt == '1';
        }
        notifyListeners();
      }
    });
  }

  void onDisconnected() {
    isConnected = false;
    notifyListeners();
  }

  void onSubscribed(String topic) {
    print('Subscribed to $topic');
  }

  void sendMessage(String topic, String message) {
    if (isConnected) {
      final builder = MqttClientPayloadBuilder();
      builder.addString(message);
      try {
        client.publishMessage(topic, MqttQos.exactlyOnce, builder.payload!);
      } catch (e) {}
    }
  }

  void handleReceivedMessages(
      List<MqttReceivedMessage<MqttMessage?>> messages) {
    for (final message in messages) {
      final MqttPublishMessage recMess = message.payload as MqttPublishMessage;
      final String pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      if (message.topic == controlTopic2) {
        isWateringActive = pt == '1';
      }
      notifyListeners();
    }
  }

  void handleReceivedMessages2(
      List<MqttReceivedMessage<MqttMessage?>> messages) {
    for (final message in messages) {
      final MqttPublishMessage recMess = message.payload as MqttPublishMessage;
      final String pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      if (message.topic == automatic) {
        isAutomatic = pt == '1';
      }
      notifyListeners();
    }
  }

  void upLume() {
    isUpLume = true;
    sendMessage(controlTopic, '1');
    notifyListeners();
  }

  void downLume() {
    isDownLume = true;
    sendMessage(controlTopic, '0');
    notifyListeners();
  }

  void toggleWatering() {
    isWateringActive = !isWateringActive;
    sendMessage(controlTopic2, isWateringActive ? '1' : '0');
    notifyListeners();
  }

  void toogleAutomatic() {
    isAutomatic = !isAutomatic;
    sendMessage(automatic, isAutomatic ? '1' : '0');
    notifyListeners();
  }
}
