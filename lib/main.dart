// ------------------------------------
// ARQUIVO: lib/main.dart (CORRIGIDO)
// ------------------------------------
import 'package:flutter/material.dart';
import 'package:adopet_flutter/screens/initial_screen.dart';
import 'package:adopet_flutter/screens/login_screen.dart';
import 'package:adopet_flutter/screens/register_screen.dart'; 
import 'package:adopet_flutter/screens/home_screen.dart';
import 'package:adopet_flutter/screens/message_screen.dart'; 
import 'package:adopet_flutter/screens/send_message_screen.dart';
import 'package:adopet_flutter/screens/profile_screen.dart';
import 'package:adopet_flutter/screens/pet_details_screen.dart'; // <-- 1. IMPORTA A NOVA TELA

void main() {
  runApp(const AdopetApp());
}

class AdopetApp extends StatelessWidget {
  const AdopetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adopet',
      debugShowCheckedModeBanner: false,
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
        '/profile': (context) => const ProfileScreen(),
        '/message': (context) => const MessageScreen(),
        '/send_message': (context) => const SendMessageScreen(),
        
        // --- 2. ADICIONA A NOVA ROTA ---
        // Ela é especial porque precisa "pegar" os dados do pet
        '/pet_details': (context) {
          final petData = ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
          return PetDetailsScreen(petData: petData);
        },
      },
    );
  }
}
