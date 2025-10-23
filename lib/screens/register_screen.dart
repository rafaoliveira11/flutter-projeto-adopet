import 'package:flutter/material.dart';
import '../widgets/auth_header.dart'; 

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              AuthHeader(), 
              _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}


class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
 
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Cadastro realizado!'),
            content: const Text(
                'Seu cadastro foi concluído com sucesso. Você será redirecionado para a tela de login.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(); 
                  Navigator.pushNamed(context, '/login'); 
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Image.asset('assets/images/logo_azul.png', width: 150),
            const SizedBox(height: 24),
            const Text(
              'Ainda não tem cadastro?\nEntão, antes de buscar seu melhor amigo, precisamos de alguns dados:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Color(0xFF757575)),
            ),
            const SizedBox(height: 32),

            _CustomTextField(
              labelText: 'Nome',
              hintText: 'Digite seu nome completo',
              controller: _nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, digite seu nome';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            _CustomTextField(
              labelText: 'Email',
              hintText: 'Escolha seu melhor email',
              controller: _emailController,
              validator: (value) {
                if (value == null || !value.contains('@')) {
                  return 'Por favor, digite um email válido';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            _CustomTextField(
              labelText: 'Senha',
              hintText: 'Crie uma senha',
              obscureText: true,
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.length < 6) {
                  return 'A senha deve ter pelo menos 6 caracteres';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            _CustomTextField(
              labelText: 'Confirme a senha',
              hintText: 'Repita a senha criada acima',
              obscureText: true,
              controller: _confirmPasswordController,
              validator: (value) {
                if (value != _passwordController.text) {
                  return 'As senhas não coincidem';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),

            ElevatedButton(
              onPressed: _register, 
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFC7071),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Cadastrar',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const _CustomTextField({
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Color(0xFF757575)),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator,
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