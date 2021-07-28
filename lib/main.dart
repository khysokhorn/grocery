import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grocery/src/config/themes/light_theme.dart';
import 'package:grocery/src/modules/login/usermodel.dart';
import 'package:grocery/src/modules/login/view/splash.dart';
import 'package:grocery/src/utils/services/localServices/hiveHelper.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'src/modules/home/view/homeView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  Directory directory = await getApplicationDocumentsDirectory();
  String path = directory.path;
  Hive
    ..init(path)
    ..registerAdapter(UserModelAdapter())
    ..registerAdapter(UserAdapter());

  await Hive.openBox("UserModel");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: HiveHelper().getUserModel() == null ? SplashScreen() : HomeView(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    // TODO: implement createHttpClient
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
