import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'dashboard/side_navigation_drawer.dart';
import 'firebase_options.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options:const FirebaseOptions(
        apiKey: "AIzaSyA2QUJjjbDQVqCN872052iI21jUIWocVBE",
        authDomain: "green-wheels-2aab0.firebaseapp.com",
        databaseURL: "https://green-wheels-2aab0-default-rtdb.asia-southeast1.firebasedatabase.app",
        projectId: "green-wheels-2aab0",
        storageBucket: "green-wheels-2aab0.appspot.com",
        messagingSenderId: "106216406985",
        appId: "1:106216406985:web:b4759814e97cfecb3eb218",
        measurementId: "G-4E4RR3R923"
    ),

  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SideNavigationDrawer(),
    );
  }
}


