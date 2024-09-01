import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:users_app/pages/dashboard.dart';
import 'authentication/login_screen.dart';


Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Permission.locationWhenInUse.isDenied.then((valueOfPermission)
  {
    if(valueOfPermission)
    {
      Permission.locationWhenInUse.request();
    }
  });

  await Permission.notification.isDenied.then((valueOfPermission)
  {
    if(valueOfPermission)
    {
      Permission.notification.request();
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Drivers App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: FirebaseAuth.instance.currentUser == null ? LoginScreen() : Dashboard(),
    );
  }
}
