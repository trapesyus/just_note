import 'package:flutter/material.dart';

class Initialize {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
  }
}
