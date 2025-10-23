import 'package:flutter/material.dart';
import '../widgets/auth_header.dart'; 

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              AuthHeader(), 
              _LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}


class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {

  final _formKey = GlobalKey<FormState>();


  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
  
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
 
    if (_formKey.currentState!.validate()) {
 
      
    
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
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
              'Já tem conta? Faça seu login:',
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
              labelText: 'Senha',
              hintText: 'Digite sua senha',
              controller: _passwordController,
              obscureText: true,
              showVisibilityIcon: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, digite sua senha';
                }
                if (value.length < 6) {
                  return 'A senha deve ter pelo menos 6 caracteres';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            TextButton(
              onPressed: () {},
              child: const Text(
                'Esqueci minha senha',
                style: TextStyle(
                    color: Color(0xFFFC7071),
                    decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: _login, 
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFC7071),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Entrar',
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

class _CustomTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final bool showVisibilityIcon;
  final TextEditingController controller; 
  final String? Function(String?)? validator; 

  const _CustomTextField({
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.showVisibilityIcon = false,
  });

  @override
  State<_CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<_CustomTextField> {
  late bool _isPasswordObscured;

  @override
  void initState() {
    super.initState();
    _isPasswordObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Color(0xFF757575)),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller, 
          validator: widget.validator, 
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
                    icon: Icon(
                      _isPasswordObscured
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
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