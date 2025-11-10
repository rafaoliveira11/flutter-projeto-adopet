import 'package:flutter/material.dart';
import 'package:adopet_flutter/widgets/app_drawer.dart'; // Importa a gaveta

// -----------------------------------------------------------------
// PARTE 1: A TELA PERFIL (COM O LAYOUT FIXO DO RODAPÉ)
// -----------------------------------------------------------------
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      drawer: const AppDrawer(), // Adiciona a gaveta
      
      // --- CORREÇÃO DO RODAPÉ (Início) ---
      // O body agora SÓ tem o conteúdo rolável.
      // O _Footer e o "calço" SizedBox(height: 80) foram REMOVIDOS daqui.
      body: SingleChildScrollView(
        child: Column(
          children: const [
            _ProfileHeader(), // Cabeçalho com o texto e ícone corrigidos
            _ProfileCard(), // Card de perfil com campos editáveis
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
            currentIndex: 0, // Quando estamos no Perfil, "Pets para adoção" está selecionado
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
          // 2. O Rodapé Verde, agora FIXO abaixo do menu
          const _Footer(),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------
// PARTE 2: O CABEÇALHO (Ajustado ao Figma)
// -----------------------------------------------------------------
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
          // A curva branca abaixo do header
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
                      // Botão de Hambúrguer para abrir a gaveta
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
                      // Ícone de Perfil (já estamos no perfil, não faz nada ao clicar)
                      IconButton(
                        icon: const Icon(Icons.person, color: Colors.white, size: 30),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // --- TEXTO DO HEADER AJUSTADO AO FIGMA ---
                  const Text(
                    'Esse é o perfil que aparece para responsáveis ou ONGs que recebem sua mensagem.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14, // Um pouco menor para caber
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 80), // Espaço para a curva
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
// PARTE 3: O CARTÃO DE PERFIL (COM ESTADO E AJUSTES DE LAYOUT)
// -----------------------------------------------------------------
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
    // Valores iniciais como no Figma
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
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24), // Margem normal
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF3772FF)), // Azul do Figma
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
              // Ícone de caneta ao lado de "Foto" (como no Figma)
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
                  _isEditing ? 'Clique na câmera para editar foto' : 'Clique na foto para editar', // Texto ajustado ao Figma
                  style: const TextStyle(fontSize: 12, color: Color(0xFFFC7071)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          
          // Campos de informação do perfil
          _ProfileInfoField(
            label: 'Nome', 
            controller: _nameController, 
            isEditing: _isEditing,
            hintText: 'Insira seu nome completo', // Hint text para edição
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
                // No mundo real, você salvaria os dados em um backend aqui
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

// -----------------------------------------------------------------
// PARTE 4: WIDGET DE INFORMAÇÃO (EDITÁVEL)
// -----------------------------------------------------------------
class _ProfileInfoField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isEditing;
  final int maxLines;
  final String? hintText; // Adicionado hintText

  const _ProfileInfoField({
    required this.label,
    required this.controller,
    required this.isEditing,
    this.maxLines = 1,
    this.hintText, // Inicializado
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
                decoration: InputDecoration( // Usando InputDecoration para o hintText
                  filled: true,
                  fillColor: const Color(0xFFF6F6F6),
                  border: OutlineInputBorder( // Usando OutlineInputBorder para borda mais consistente
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  hintText: hintText, // Adicionando o hintText
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


// -----------------------------------------------------------------
// PARTE 5: O RODAPÉ (PADRONIZADO)
// -----------------------------------------------------------------
class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF88C9BF), 
      padding: const EdgeInsets.all(16),
      width: double.infinity, 
      // Padronizando o texto com o que você disse que estava "perfeito"
      child: const Text(
        '2025 - Desenvolvido por Rafa e Henrique. Projeto fictício sem fins comerciais.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}