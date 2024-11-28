import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart'; // Importa o controlador de autenticação
import '../models/user.dart'; // Importa o modelo de usuário
import 'login_page.dart'; // Importa a página de login

// Classe que representa a página de cadastro, que é um StatefulWidget
class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

// Estado da página de cadastro
class _CadastroPageState extends State<CadastroPage> {
  // Controladores de texto para os campos de entrada
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _contatoController = TextEditingController();

  // Chave global para o formulário
  final _formKey = GlobalKey<FormState>();

  // Função para validar se o email é válido (contém '@')
  bool _isValidEmail(String email) {
    return email.contains('@');
  }

  // Função para validar se o nome não contém números ou símbolos
  bool _isValidNome(String nome) {
    return !RegExp(r'[0-9!@#$%^&*(),.?":{}|<>]').hasMatch(nome);
  }

  // Função para validar se o CPF contém apenas números
  bool _isValidCPF(String cpf) {
    return RegExp(r'^[0-9]+$').hasMatch(cpf);
  }

  // Função para validar se o contato contém apenas números
  bool _isValidContato(String contato) {
    return RegExp(r'^[0-9]+$').hasMatch(contato);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFFAF8EF), // Define a cor de fundo do Scaffold
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 40),
                // Logotipo
                Center(
                  child: Image.asset(
                    'assets/images/pet_amigo_logo.png',
                    height: 100,
                  ),
                ),
                const SizedBox(height: 10),
                // Título
                const Text(
                  'PET AMIGO',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 20),
                // Campos de entrada
                _buildTextField('NOME', _nomeController, _isValidNome,
                    'Nome não pode conter números ou símbolos'),
                const SizedBox(height: 15),
                _buildTextField('E-MAIL', _emailController, _isValidEmail,
                    'E-mail deve conter o símbolo @'),
                const SizedBox(height: 15),
                _buildTextField('CPF', _cpfController, _isValidCPF,
                    'CPF deve conter apenas números'),
                const SizedBox(height: 15),
                _buildTextField('CONTATO', _contatoController, _isValidContato,
                    'Contato deve conter apenas números'),
                const SizedBox(height: 30),

                // Botão Adotar
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB2F77C),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Se os dados forem válidos, registre o usuário
                      final user = User(
                        nome: _nomeController.text,
                        email: _emailController.text,
                        cpf: _cpfController.text,
                        contato: _contatoController.text,
                        password: _cpfController.text, // A senha é o CPF
                        name: '', // Parâmetro obrigatório
                        contact: '', // Parâmetro obrigatório
                      );
                      AuthController.registerUser(user);

                      // Navegar para a página de login
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    }
                  },
                  child: const Text(
                    'ADOTAR!',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                // Rodapé
                const Text(
                  'ADOTANDO SEU AMIGO!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método para construir campos de texto com validação
  Widget _buildTextField(String hint, TextEditingController controller,
      bool Function(String) validator, String errorMessage) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.orange,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$hint é obrigatório';
        }
        if (!validator(value)) {
          return errorMessage;
        }
        return null;
      },
    );
  }
}
