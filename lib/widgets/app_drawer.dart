import 'package:flutter/material.dart';

// Este é o nosso widget de "Gaveta" reutilizável
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // O child é um Container para darmos a cor verde-água
      child: Container(
        color: const Color(0xFF88C9BF), // A cor verde-água do cabeçalho
        // ListView garante que o menu role se tiver muitos itens
        child: ListView(
          padding: EdgeInsets.zero, // Remove qualquer espaço em branco no topo
          children: [
            // 1. O Cabeçalho da Gaveta (com avatar e 'X' para fechar)
            SizedBox(
              height: 150, // Uma altura fixa para o cabeçalho
              child: DrawerHeader(
                decoration: const BoxDecoration(color: Color(0xFF88C9BF)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Ícone 'X' para fechar a gaveta
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white, size: 30),
                      onPressed: () {
                        // Comando especial para fechar a gaveta
                        Navigator.of(context).pop();
                      },
                    ),
                    // O avatar que você mencionou
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                  ],
                ),
              ),
            ),

            // 2. Os Itens do Menu
            // Usamos ListTile por ser perfeito para (ícone + texto)
            ListTile(
              // leading é o widget que fica na esquerda
              leading: Image.asset(
                'assets/images/icon_pets.png',
                color: Colors.white, // Isso "pinta" seu ícone de branco
                width: 24,
              ),
              // title é o texto principal
              title: const Text(
                'Pets para adoção',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onTap: () {
                // Navega para a Home e limpa as outras telas
                Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
              },
            ),

            ListTile(
              leading: Image.asset(
                'assets/images/icon_mensagem.png',
                color: Colors.white,
                width: 24,
              ),
              title: const Text(
                'Mensagens',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/message');
              },
            ),

            ListTile(
              leading: Image.asset(
                'assets/images/icon_settings.png',
                color: Colors.white,
                width: 24,
              ),
              title: const Text(
                'Configurações',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onTap: () {
                // Ainda não temos essa tela, então só fechamos a gaveta
                Navigator.of(context).pop();
              },
            ),

            // Uma linha divisória bonitinha
            const Divider(color: Colors.white54, indent: 16, endIndent: 16),

            ListTile(
              leading: Image.asset(
                'assets/images/icon_logout.png',
                color: Colors.white,
                width: 24,
              ),
              title: const Text(
                'Sair',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onTap: () {
                // Navega para a tela Inicial e limpa todas as outras
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}