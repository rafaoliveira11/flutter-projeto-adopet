import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF88C9BF), 
        child: ListView(
          padding: EdgeInsets.zero, 
          children: [
            SizedBox(
              height: 150,
              child: DrawerHeader(
                decoration: const BoxDecoration(color: Color(0xFF88C9BF)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white, size: 30),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                  ],
                ),
              ),
            ),

            ListTile(
              leading: Image.asset(
                'assets/images/icon_pets.png',
                color: Colors.white, 
                width: 24,
              ),
              title: const Text(
                'Pets para adoção',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onTap: () {
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
                Navigator.of(context).pop();
              },
            ),

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
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}