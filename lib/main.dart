// ------------------------------------
// ARQUIVO: lib/main.dart (CORRIGIDO)
// ------------------------------------
import 'package:flutter/material.dart';
import 'package:adopet_flutter/screens/initial_screen.dart';
import 'package:adopet_flutter/screens/login_screen.dart';
import 'package:adopet_flutter/screens/register_screen.dart'; 
import 'package:adopet_flutter/screens/home_screen.dart';
import 'package:adopet_flutter/screens/message_screen.dart'; // A Caixa de entrada (Inbox)
import 'package:adopet_flutter/screens/send_message_screen.dart'; // O Formulário de Envio
//import 'package:adopet_flutter/screens/profile_screen.dart'; // <-- VAMOS ATIVAR ISSO

void main() {
  runApp(const AdopetApp());
}

class AdopetApp extends StatelessWidget {
  const AdopetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adopet',
      debugShowCheckedModeBanner: false, // Remove a faixa de "Debug"
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins', 
      ),
  
      initialRoute: '/',

      routes: {
        '/': (context) => const InitialScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(), 
        '/home': (context) => const HomeScreen(), 
        '/message': (context) => const MessageScreen(), // Rota da Gaveta (Inbox)
        '/send_message': (context) => const SendMessageScreen(), // Rota da Barra de Baixo
        
        // --- CORREÇÃO AQUI ---
        // A rota do perfil agora está ATIVA.
        //'/profile': (context) => const ProfileScreen(),
      },
    );
  }
}