import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final storage = GetStorage();

  final List<Map<String, dynamic>> vehicles = const [
    {"title": "Private Car", "colors": [Colors.white, Colors.grey], "shadow": Colors.white, "textColor": Colors.black},
    {"title": "Pickup", "colors": [Colors.blueAccent, Colors.blue], "shadow": Colors.blue, "textColor": Colors.white},
    {"title": "Truck", "colors": [Colors.yellowAccent, Colors.orange], "shadow": Colors.yellow, "textColor": Colors.black},
    {"title": "Bus", "colors": [Colors.pinkAccent, Colors.pink], "shadow": Colors.pink, "textColor": Colors.white},
    {"title": "CNG", "colors": [Colors.greenAccent, Colors.green], "shadow": Colors.green, "textColor": Colors.white},
    {"title": "Auto", "colors": [Colors.black, Colors.grey], "shadow": Colors.black, "textColor": Colors.white},
    {"title": "Bike", "colors": [Colors.redAccent, Colors.red], "shadow": Colors.red, "textColor": Colors.white},
  ];

  late RxList<int> counts = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    final storedCounts = storage.read<List<dynamic>>('counts');
    if (storedCounts != null && storedCounts.length == vehicles.length) {
      counts.value = storedCounts.map((e) => e as int).toList();
    } else {
      counts.value = List<int>.filled(vehicles.length, 0);
    }
  }

  void increment(int index) {
    counts[index]++;
    counts.refresh(); // trigger UI update
    storage.write('counts', counts.toList());
  }

  void resetAll() {
    counts.value = List<int>.filled(vehicles.length, 0);
    storage.write('counts', counts.toList());
  }
}
