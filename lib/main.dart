import 'package:flutter/material.dart';
import 'package:myapp/SplashScreen/Splash.dart';
import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GameToy',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(255, 230, 0, 1)),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
    
  }
}
