import 'package:bankapp/screen/index_screen.dart';
import 'package:bankapp/utils/app_colors.dart';
import 'package:device_frame_plus/device_frame_plus.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'MyCustomFont',
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.kscaffoldBackgroundColor,
        ),
        scaffoldBackgroundColor: AppColors.kscaffoldBackgroundColor,
      ),
      home: DeviceFrame(
        device: Devices.ios.iPhone13,
        isFrameVisible: true,
        orientation: Orientation.portrait,
        screen: const IndexScreen(),
      ),
    );
  }
}
