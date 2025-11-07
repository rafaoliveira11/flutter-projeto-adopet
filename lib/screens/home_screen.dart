// ------------------------------------
// ARQUIVO: lib/screens/home_screen.dart (CORRIGIDO)
// ------------------------------------
import 'package:flutter/material.dart';
import 'package:adopet_flutter/widgets/app_drawer.dart'; 

// A lista de Pets está perfeita!
const List<Map<String, String>> mockPets = [
  {
    'name': 'Dunga',
    'image': 'Imagem_Dunga.png',
    'age': '2 anos',
    'size': 'Porte pequeno',
    'features': 'Calmo e educado',
    'location': 'Rio de Janeiro (RJ)',
  },
  {
    'name': 'Felícia',
    'image': 'Imagens_Felicia.png',
    'age': '3 meses',
    'size': 'Porte pequeno',
    'features': 'Ativa e carinhosa',
    'location': 'Nova Iguaçu (RJ)',
  },
  {
    'name': 'Sirius',
    'image': 'Imagem_Sirius.png',
    'age': '6 meses',
    'size': 'Porte grande',
    'features': 'Ativo e educado',
    'location': 'Duque de Caxias (RJ)',
  },
  {
    'name': 'Fiona',
    'image': 'Imagem_Fiona.png',
    'age': '3 anos',
    'size': 'Porte pequeno',
    'features': 'Calma e carinhosa',
    'location': 'São Gonçalo (RJ)',
  },
  {
    'name': 'Sid',
    'image': 'Imagem_Sid.png',
    'age': '8 meses',
    'size': 'Porte médio/grande',
    'features': 'Brincalhão e amável',
    'location': 'Rio de Janeiro (RJ)',
  },
  {
    'name': 'Yoda',
    'image': 'Imagem_Yoda.png',
    'age': '1 ano',
    'size': 'Porte médio',
    'features': 'Ativo e carinhoso',
    'location': 'Nova Iguaçu (RJ)',
  },
  {
    'name': 'Lua',
    'image': 'Imagem_Lua.png',
    'age': '6 meses',
    'size': 'Porte médio',
    'features': 'Ativa e carinhosa',
    'location': 'Duque de Caxias (RJ)',
  },
  {
    'name': 'Amora',
    'image': 'Imagem_Amora.png',
    'age': '45 dias',
    'size': 'Porte grande',
    'features': 'Calma e carinhosa',
    'location': 'São Gonçalo (RJ)',
  },
  {
    'name': 'Zelda',
    'image': 'Imagem_Zelda.png',
    'age': '5 meses',
    'size': 'Porte médio',
    'features': 'Ativa e amável',
    'location': 'Rio de Janeiro (RJ)',
  },
];


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _HomeHeader(),
            Container(
              color: const Color(0xFFF7F7F7),
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: mockPets.map((pet) {
                  return _PetCard(pet: pet);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFF88C9BF),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed, 
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
          // --- CORREÇÃO AQUI ---
          // O botão "Mensagens" da barra de baixo (índice 1)
          // agora leva para o FORMULÁRIO.
          if (index == 1) {
            Navigator.pushNamed(context, '/send_message'); 
          }
        },
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF88C9BF),
      child: Stack(
        clipBehavior: Clip.none,
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
                        icon: const Icon(Icons.person_outline,
                            color: Colors.white, size: 30),
                        onPressed: () {
                          // Rota ativada em main.dart
                          Navigator.pushNamed(context, '/profile');
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Olá! Veja os amigos disponíveis para adoção!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PetCard extends StatelessWidget {
  final Map<String, String> pet;

  const _PetCard({required this.pet});

  @override
  Widget build(BuildContext context) {
    // Código de imagem limpo, sem try-catch
    final petImage = Image.asset(
      'assets/images/${pet['image']}',
      width: 130, 
      height: 120,
      fit: BoxFit.cover, // Adicionado para a imagem não distorcer
      errorBuilder: (context, error, stackTrace) {
        // Widget que aparece se a imagem não for encontrada
        return Container(
          width: 130,
          height: 120,
          color: Colors.grey[200],
          child: const Icon(Icons.pets, color: Colors.grey, size: 40),
        );
      },
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(26), 
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          petImage,
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pet['name']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3772FF),
                  ),
                ),
                const SizedBox(height: 4),
                Text(pet['age']!, style: const TextStyle(color: Colors.grey)),
                Text(pet['size']!, style: const TextStyle(color: Colors.grey)),
                Text(pet['features']!,
                    style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),
                Text(pet['location']!,
                    style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    // --- CORREÇÃO AQUI ---
                    // O link no card também leva para o FORMULÁRIO.
                    Navigator.pushNamed(context, '/send_message'); 
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.chat_bubble_outline,
                          size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text('Falar com responsável',
                          style: TextStyle(color: Colors.grey.shade700)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}