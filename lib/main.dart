import 'package:flutter/material.dart';
import 'login_page.dart'; // Importe sua tela de login

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetAmigo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TelaPrincipal(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => RegisterPage(), // Certifique-se de ter a tela de cadastro
      },
    );
  }
}
