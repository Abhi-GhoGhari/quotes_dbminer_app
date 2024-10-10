import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_dbminer_app/controller/theam_controller/theam_controller.dart';
import 'package:quotes_dbminer_app/routes/app_route/app_route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      themeMode: Provider.of<TheamController>(context).tm,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}
