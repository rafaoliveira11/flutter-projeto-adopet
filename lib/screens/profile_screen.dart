import 'package:flutter/material.dart';
import 'package:adopet_flutter/widgets/app_drawer.dart'; 


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      drawer: const AppDrawer(), 
      
      body: SingleChildScrollView(
        child: Column(
          children: const [
            _ProfileHeader(), 
            _ProfileCard(), 
          ],
        ),
      ),

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
          const _Footer(),
        ],
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

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
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Esse é o perfil que aparece para responsáveis ou ONGs que recebem sua mensagem.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14, 
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

class _ProfileCard extends StatefulWidget {
  const _ProfileCard();

  @override
  State<_ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<_ProfileCard> {
  bool _isEditing = false;
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _cityController;
  late TextEditingController _aboutController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'Joana Magalhães');
    _phoneController = TextEditingController(text: '55 11 XXXXXXXX');
    _cityController = TextEditingController(text: 'São Paulo');
    _aboutController = TextEditingController(text: 'Ao vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati.');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    _aboutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24), 
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Perfil',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF3772FF)), 
            ),
          ),
          const SizedBox(height: 24),
          
          Row(
            children: [
              const Text(
                'Foto',
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3772FF)),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.edit, size: 16, color: Color(0xFF3772FF)),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: const AssetImage('assets/images/avatar.png'), 
                ),
                const SizedBox(height: 8),
                Text(
                  _isEditing ? 'Clique na câmera para editar foto' : 'Clique na foto para editar', 
                  style: const TextStyle(fontSize: 12, color: Color(0xFFFC7071)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          
          _ProfileInfoField(
            label: 'Nome', 
            controller: _nameController, 
            isEditing: _isEditing,
            hintText: 'Insira seu nome completo', 
          ),
          const SizedBox(height: 16),
          _ProfileInfoField(
            label: 'Telefone', 
            controller: _phoneController, 
            isEditing: _isEditing,
            hintText: 'Insira seu telefone e/ou whatsapp',
          ),
          const SizedBox(height: 16),
          _ProfileInfoField(
            label: 'Cidade', 
            controller: _cityController, 
            isEditing: _isEditing,
            hintText: 'Insira sua cidade',
          ),
          const SizedBox(height: 16),
          _ProfileInfoField(
            label: 'Sobre', 
            controller: _aboutController, 
            isEditing: _isEditing, 
            maxLines: 5,
            hintText: 'Fale um pouco sobre você',
          ),
          const SizedBox(height: 32),

          ElevatedButton(
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
                if (!_isEditing) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Perfil salvo com sucesso!')),
                  );
                }
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFC7071),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              minimumSize: const Size(double.infinity, 50),
            ),
            child: Text(
              _isEditing ? 'Salvar' : 'Editar', 
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileInfoField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isEditing;
  final int maxLines;
  final String? hintText; 

  const _ProfileInfoField({
    required this.label,
    required this.controller,
    required this.isEditing,
    this.maxLines = 1,
    this.hintText, 
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3772FF)),
        ),
        const SizedBox(height: 4),
        isEditing
            ? TextFormField(
                controller: controller,
                maxLines: maxLines,
                decoration: InputDecoration( 
                  filled: true,
                  fillColor: const Color(0xFFF6F6F6),
                  border: OutlineInputBorder( 
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  hintText: hintText, 
                ),
              )
            : Text(
                controller.text,
                style: const TextStyle(color: Color(0xFF757575), fontSize: 16),
              ),
      ],
    );
  }
}


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