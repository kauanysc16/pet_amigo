import 'package:flutter/material.dart';
import 'package:pet_amigo/views/cadastro_page.dart';
import 'package:pet_amigo/views/home_page.dart';
import 'package:pet_amigo/views/login_page.dart';

void main() {
  runApp(const PetAdoptionApp());
}

class PetAdoptionApp extends StatelessWidget {
  const PetAdoptionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Amigo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const TelaPrincipal(),
        '/login': (context) => const LoginPage(), // Página de login
        '/register': (context) => const CadastroPage(), // Página de cadastro
      },
    );
  }
}
