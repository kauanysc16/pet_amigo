import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pet_amigo/views/cadastro_page.dart';
import 'package:pet_amigo/views/home_page.dart';
import 'package:pet_amigo/views/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        '/': (context) => const TelaPrincipal(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const CadastroPage(),
      },
    );
  }
}
