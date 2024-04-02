import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:harekrishnagoldentemple/Bottom_Navigation/Bottom_Navigation.dart';
import 'package:harekrishnagoldentemple/Home/controller/carousel_controller.dart';
import 'package:harekrishnagoldentemple/Home/home.dart';
import 'package:harekrishnagoldentemple/Login/Login.dart';
import 'package:harekrishnagoldentemple/NoInternet.dart';
import 'package:harekrishnagoldentemple/Notifications.dart';
import 'package:harekrishnagoldentemple/Seek_Divine_Blessings/Seek_Divine_Blessings_LIS.dart';
import 'package:no_context_navigation/no_context_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.instance.getToken().then((value) {
    String? token = value;
    print(token);
  });
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print(message);
  });
  Get.put(CarouselController());

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      return MaterialApp(
      title: 'Hare Krishna Golden Temple',
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigationKey,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/notifications':
            return MaterialPageRoute(builder: (_) => const Notifications());
          case '/SDBLIS': // Define route for SDBLIS screen
            return MaterialPageRoute(builder: (_) => SDBLIS());
          default:
            return null;
        }
      },
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LogIn(),
    );
    } else {
      return MaterialApp(
      title: 'Hare Krishna Golden Temple',
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigationKey,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/notifications':
            return MaterialPageRoute(builder: (_) => const Notifications());
          case '/SDBLIS': // Define route for SDBLIS screen
            return MaterialPageRoute(builder: (_) => SDBLIS());
          default:
            return null;
        }
      },
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: NaviBottomNavBar(),
    );
    }
  } 
}

