import 'package:flutter/material.dart';
import 'package:adopet_flutter/widgets/app_drawer.dart'; // Importa nossa gaveta

// -----------------------------------------------------------------
// DADOS FALSOS (Nenhuma mudança aqui)
// -----------------------------------------------------------------
const List<Map<String, String>> mockMessages = [
  {
    'name': 'Maria',
    'message': 'Olá, tudo bem?',
  },
  {
    'name': 'João',
    'message': 'Você quer saber mais sobre o Dunga?',
  },
  {
    'name': 'Pedro',
    'message': 'Me interessei muito por ele',
  },
];

// -----------------------------------------------------------------
// PARTE 1: A TELA DE MENSAGENS (COM A CORREÇÃO DO RODAPÉ)
// -----------------------------------------------------------------
class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      drawer: const AppDrawer(), // Adiciona a gaveta
      
      // --- CORREÇÃO AQUI ---
      // O body agora SÓ tem o conteúdo rolável.
      // O _Footer e o "calço" SizedBox(height: 80) foram REMOVIDOS daqui.
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _MessageHeader(), // O cabeçalho verde
            const _MessageListBody(), // O corpo com a lista de msgs
          ],
        ),
      ),
      
      // --- E A CORREÇÃO PRINCIPAL ESTÁ AQUI ---
      // Colocamos uma Coluna no bottomNavigationBar
      // para empilhar o Menu e o Rodapé FIXOS no fundo.
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min, // Faz a coluna ter o tamanho mínimo
        children: [
          // 1. O Menu "Pets/Mensagens"
          BottomNavigationBar(
            currentIndex: 1, // DEIXA "MENSAGENS" SELECIONADO
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
              }
            },
          ),
          // 2. O Rodapé Verde, agora FIXO abaixo do menu
          const _Footer(),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------
// PARTE 2: O CABEÇALHO (Nenhuma mudança aqui)
// -----------------------------------------------------------------
class _MessageHeader extends StatelessWidget {
  const _MessageHeader();

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
                        icon: const Icon(Icons.person, color: Colors.white, size: 30),
                        onPressed: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                      ),
                    ],
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

// -----------------------------------------------------------------
// PARTE 3: O CORPO DA TELA (Nenhuma mudança aqui)
// -----------------------------------------------------------------
class _MessageListBody extends StatelessWidget {
  const _MessageListBody();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF7F7F7),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Column(
        children: [
          const Text(
            'Caixa de mensagens',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3772FF),
            ),
          ),
          const SizedBox(height: 24),
          Column(
            children: mockMessages.map((msg) {
              return _MessageCard(name: msg['name']!, message: msg['message']!);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------
// PARTE 4: O CARD DE MENSAGEM (Nenhuma mudança aqui)
// -----------------------------------------------------------------
class _MessageCard extends StatelessWidget {
  final String name;
  final String message;

  const _MessageCard({required this.name, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF3772FF),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            message,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }
}


// -----------------------------------------------------------------
// PARTE 5: O RODAPÉ (Nenhuma mudança aqui)
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