import 'package:flutter/material.dart';
import 'package:adopet_flutter/screens/initial_screen.dart';
import 'package:adopet_flutter/screens/login_screen.dart';
import 'package:adopet_flutter/screens/register_screen.dart';
import 'package:adopet_flutter/screens/home_screen.dart';
import 'package:adopet_flutter/screens/message_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adopet',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      
    
      initialRoute: '/', 
      
      
      routes: {
        '/': (context) => const InitialScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/messages': (context) => const MessageScreen(), 
      },
    );
  }
}