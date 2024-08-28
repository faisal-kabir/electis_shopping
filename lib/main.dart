import 'package:electis_shopping/screens/dashboard/dashboard.dart';
import 'package:electis_shopping/theme/app_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Electis Shopping',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
        primaryColor: AppColor.primary,
        useMaterial3: true,
        scaffoldBackgroundColor: AppColor.backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.primary
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: AppColor.buttonColor
        ),
        iconTheme: const IconThemeData(
          color: AppColor.iconColor
        )
      ),
      home: Dashboard(),
    );
  }
}

