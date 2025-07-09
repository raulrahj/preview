import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:preview/app.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      isToolbarVisible: false,
      defaultDevice: Devices.android.samsungGalaxyS25,
      tools: const [...DevicePreview.defaultTools],
      builder: (context) => const MyApp(),
    ),
  );
}
