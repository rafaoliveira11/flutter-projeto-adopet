import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _Header(), 
              _LoginForm(), 
            ],
          ),
        ),
      ),
    );
  }
}


class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: const Color(0xFF88C9BF),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            right: 20,
            child: Image.asset(
              'assets/images/patas.png',
              width: 120,
            ),
          ),
          Positioned(
            bottom: -60,
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


class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Column(
        children: [
          Image.asset('assets/images/logo_azul.png', width: 150),
          const SizedBox(height: 24),
          const Text(
            'Já tem conta? Faça seu login:',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Color(0xFF757575)),
          ),
          const SizedBox(height: 32),

         
          const _CustomTextField(labelText: 'Nome', hintText: 'Digite seu nome completo'),
          const SizedBox(height: 16),
          
          const _CustomTextField(labelText: 'Senha', hintText: 'Digite sua senha', obscureText: true, showVisibilityIcon: true),
          const SizedBox(height: 16),
          
       
          TextButton(
            onPressed: () {},
            child: const Text(
              'Esqueci minha senha',
              style: TextStyle(color: Color(0xFFFC7071), decoration: TextDecoration.underline),
            ),
          ),
          const SizedBox(height: 16),

          
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFC7071),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text(
              'Entrar',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget reutilizável para os campos de texto, agora com ESTADO!
class _CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final bool showVisibilityIcon;

  const _CustomTextField({
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
    this.showVisibilityIcon = false,
  });

  @override
  State<_CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<_CustomTextField> {
  // 1. Nossa "variável interruptor". Começa como 'true' (escondido).
  late bool _isPasswordObscured;

  @override
  void initState() {
    super.initState();
    // Inicializa a variável com o valor que veio de fora
    _isPasswordObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF757575)),
        ),
        const SizedBox(height: 8),
        TextFormField(
          // 2. A visibilidade agora é controlada pela nossa variável de estado
          obscureText: _isPasswordObscured,
          decoration: InputDecoration(
            hintText: widget.hintText,
            filled: true,
            fillColor: const Color(0xFFF6F6F6),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            suffixIcon: widget.showVisibilityIcon
                ? IconButton(
                    // 3. O ícone muda dependendo do estado
                    icon: Icon(
                      _isPasswordObscured ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    // 4. A mágica acontece aqui!
                    onPressed: () {
                      // O comando setState avisa o Flutter para redesenhar a tela
                      setState(() {
                        // Invertemos o valor do interruptor (true vira false, false vira true)
                        _isPasswordObscured = !_isPasswordObscured;
                      });
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }
}