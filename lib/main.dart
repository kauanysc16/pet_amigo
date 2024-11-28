import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'views/cadastro_page.dart';
import 'views/home_page.dart';
import 'views/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart'; // Importando o arquivo gerado

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Usando as opções geradas
  );
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
