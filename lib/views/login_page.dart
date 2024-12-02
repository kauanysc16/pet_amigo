import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color(0xFF17706E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Digite seu email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Senha',
                hintText: 'Digite sua senha',
                border: OutlineInputBorder(),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Lógica de login
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF17706E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Entrar', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Navegar para a tela de cadastro
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Não tem uma conta? Cadastre-se'),
            ),
          ],
        ),
      ),
    );
  }
}
