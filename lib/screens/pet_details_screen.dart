import 'package:flutter/material.dart';
import 'package:adopet_flutter/widgets/app_drawer.dart';

// -----------------------------------------------------------------
// PARTE 1: A TELA DE DETALHES (Com o layout de rodapé que você gosta)
// -----------------------------------------------------------------
class PetDetailsScreen extends StatelessWidget {
  final Map<String, String?> petData;
  const PetDetailsScreen({super.key, required this.petData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      drawer: const AppDrawer(),
      
      // O layout com rodapé FIXO
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomNavigationBar(
            currentIndex: 0, 
            selectedItemColor: const Color(0xFF88C9BF),
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.pets),
                label: 'Pets para adoção',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message_outlined),
                label: 'Mensagens',
              ),
            ],
            onTap: (index) {
              if (index == 0) {
                Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
              } else if (index == 1) {
                Navigator.pushNamed(context, '/send_message');
              }
            },
          ),
          const _Footer(), // O rodapé verde fixo
        ],
      ),

      // O corpo da tela é rolável
      body: SingleChildScrollView(
        child: Column(
          children: [
            _PetDetailsHeader(
              petName: petData['name']!,
              imageUrl: petData['image']!,
            ),
            _PetDetailsBody(petData: petData),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------
// PARTE 2: CABEÇALHO DA TELA DE DETALHES
// -----------------------------------------------------------------
class _PetDetailsHeader extends StatelessWidget {
  final String petName;
  final String imageUrl;
  const _PetDetailsHeader({required this.petName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF88C9BF),
      child: Stack(
        clipBehavior: Clip.none, 
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: -80,
            left: 0,
            right: 0,
            child: Container(
              height: 120,
              decoration: const BoxDecoration(
                color: Color(0xFFF7F7F7),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          'assets/images/icon_hamburguer.png',
                          color: Colors.white,
                          width: 24,
                        ),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.person, color: Colors.white, size: 30),
                        onPressed: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 80), // Espaço para o Avatar
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/$imageUrl'),
                ),
                border: Border.all(color: Colors.white, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------
// PARTE 3: CORPO DA TELA DE DETALHES (COM AS CORREÇÕES)
// -----------------------------------------------------------------
class _PetDetailsBody extends StatelessWidget {
  final Map<String, String?> petData;
  const _PetDetailsBody({required this.petData});

  @override
  Widget build(BuildContext context) {
    final List<String> detailsList = petData['details']?.split('\n') ?? [];

    return Container(
      padding: const EdgeInsets.all(24),
      color: const Color(0xFFF7F7F7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 60),
          Center(
            child: Text(
              petData['name']!,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3772FF),
              ),
            ),
          ),
          const SizedBox(height: 24),
          ...detailsList.map((detail) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 16),
            child: Text(
              '• $detail',
              style: const TextStyle(fontSize: 16, color: Color(0xFF757575)),
            ),
          )),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              petData['location']!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF757575),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/send_message');
                },
                child: Row(
                  children: [
                    const Icon(Icons.chat_bubble_outline, size: 20, color: Color(0xFF88C9BF)),
                    const SizedBox(width: 8),
                    Text(
                      'Falar com responsável',
                      style: TextStyle(
                        color: const Color(0xFF88C9BF),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              GestureDetector(
                onTap: () { /* Ação de compartilhar */ },
                child: Row(
                  children: [
                    const Icon(Icons.share, size: 20, color: Color(0xFF88C9BF)),
                    const SizedBox(width: 8),
                    Text(
                      'Compartilhar',
                      style: TextStyle(
                        color: const Color(0xFF88C9BF),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            petData['description']!,
            textAlign: TextAlign.justify,
            style: const TextStyle(color: Color(0xFF757575), fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 24),

          // --- CORREÇÃO AQUI (Diminuir e Aproximar) ---
          if (petData['image_2'] != null)
            Padding(
              // 1. "Mais próximas": Diminuí o padding de 8.0 para 4.0
              padding: const EdgeInsets.symmetric(vertical: 4.0), 
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/${petData['image_2']}',
                  // 2. "Diminuir": Fixei a altura da imagem
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
          if (petData['image_3'] != null)
            Padding(
              // 1. "Mais próximas": Diminuí o padding de 8.0 para 4.0
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/${petData['image_3']}',
                  // 2. "Diminuir": Fixei a altura da imagem
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------
// PARTE 4: O RODAPÉ (Padrão "Rafa e Henrique")
// -----------------------------------------------------------------
class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF88C9BF), 
      padding: const EdgeInsets.all(16),
      width: double.infinity, 
      child: const Text(
        '2025 - Desenvolvido por Rafa e Henrique. Projeto fictício sem fins comerciais.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}