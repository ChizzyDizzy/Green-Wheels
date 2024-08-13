import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'dashboard/side_navigation_drawer.dart';
import 'firebase_options.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options:const FirebaseOptions(
        apiKey: "AIzaSyC2W9PZteEUboByTOmcC-t_HBThg1E8wEM",
        authDomain: "green-wheels-97a8a.firebaseapp.com",
        databaseURL: "https://green-wheels-97a8a-default-rtdb.firebaseio.com",
        projectId: "green-wheels-97a8a",
        storageBucket: "green-wheels-97a8a.appspot.com",
        messagingSenderId: "530541456838",
        appId: "1:530541456838:web:0c0bfdfbbf59a5240056c7",
        measurementId: "G-QQ2WRMNV6B"
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


