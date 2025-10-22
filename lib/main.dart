import 'package:flutter/material.dart';
import 'package:adopet_flutter/screens/initial_screen.dart';
import 'package:adopet_flutter/screens/login_screen.dart';
import 'package:adopet_flutter/screens/register_screen.dart'; 
//import 'package:adopet_flutter/screens/home_screen.dart'; // Crie este arquivo

void main() {
  runApp(const AdopetApp());
}

class AdopetApp extends StatelessWidget {
  const AdopetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adopet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins', // Exemplo se você adicionar uma fonte customizada
      ),
      // Rota inicial da aplicação
      initialRoute: '/',
      // Definição de todas as rotas
      routes: {
        '/': (context) => const InitialScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(), 
        //home': (context) => const HomeScreen(), // Você precisará criar o widget HomeScreen
      },
    );
  }
}