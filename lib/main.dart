import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoflutter/util/adapter.dart';
import 'package:todoflutter/util/notification.dart';
import 'pages/home_page.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  // init the hive
  await Hive.initFlutter();

  NotificationApi().initNotification();
  tz.initializeTimeZones();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Hive.registerAdapter(DateTimeAdapter());
  
  

  // open a box
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget  {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      // theme: ThemeData(primarySwatch: Colors.black),
    );
  }
}
