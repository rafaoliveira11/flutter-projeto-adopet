import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Usamos um SafeArea para garantir que o conteúdo não fique sob as barras do sistema
    return const SafeArea(
      child: Scaffold(
        // Usamos um SingleChildScrollView para que a tela seja rolável em celulares menores
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Parte de cima com o fundo verde e as patas
              _Header(),
              // Parte de baixo com o formulário
              _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget para o cabeçalho verde com as patas
class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200, // Altura do cabeçalho
      color: const Color(0xFF88C9BF), // Fundo verde-água
      child: Stack(
        children: [
          // Posiciona a imagem das patas no canto superior direito
          Positioned(
            top: 20,
            right: 20,
            child: Image.asset(
              'assets/images/patas.png', // Verifique o nome deste arquivo!
              width: 120,
            ),
          ),
          // Adiciona o efeito da curva branca sobre o fundo verde
          Positioned(
            bottom: -60, // Posição da curva para criar o efeito desejado
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(100),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Widget para o formulário de cadastro
class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Fundo branco para o formulário
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Column(
        children: [
          // Logo azul da Adopet
          Image.asset('assets/images/logo_azul.png', width: 150), // Verifique o nome!
          const SizedBox(height: 24),
          const Text(
            'Ainda não tem cadastro?\nEntão, antes de buscar seu melhor amigo, precisamos de alguns dados:',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Color(0xFF757575)),
          ),
          const SizedBox(height: 32),

          // Campo de texto para o Nome
          const _CustomTextField(labelText: 'Nome', hintText: 'Digite seu nome completo'),
          const SizedBox(height: 16),
          // Campo de texto para o Email
          const _CustomTextField(labelText: 'Email', hintText: 'Escolha seu melhor email'),
          const SizedBox(height: 16),
          // Campo de texto para a Senha
          const _CustomTextField(labelText: 'Senha', hintText: 'Crie uma senha', obscureText: true),
          const SizedBox(height: 16),
          // Campo de texto para Confirmar a Senha
          const _CustomTextField(labelText: 'Confirme a senha', hintText: 'Repita a senha criada acima', obscureText: true),
          const SizedBox(height: 32),

          // Botão de Cadastrar
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFC7071),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              'Cadastrar',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget reutilizável para os campos de texto, para não repetir código
class _CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;

  const _CustomTextField({
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF757575)),
        ),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: const Color(0xFFF6F6F6),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}