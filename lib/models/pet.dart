import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_amigo/models/anunciante.dart'; // Certifique-se de que a classe Anunciante está importada

class Pet {
  final String nome;
  final String idade;
  final String imagem;
  final String genero;
  final List<String> caracteristicas;
  final String localizacao;
  final Anunciante anunciante;
  final String biografia;

  Pet({
    required this.nome,
    required this.idade,
    required this.imagem,
    required this.genero,
    required this.caracteristicas,
    required this.localizacao,
    required this.anunciante,
    required this.biografia,
  });

  // Método para criar um Pet a partir de um documento Firestore
  factory Pet.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // Criando o objeto Anunciante a partir de um documento (presumindo que ele esteja no Firestore)
    Anunciante anunciante = Anunciante.fromFirestore(data['anunciante']);

    return Pet(
      nome: data['nome'] ?? '',
      idade: data['idade'] ?? '',
      imagem: data['imagem'] ?? '',
      genero: data['genero'] ?? '',
      caracteristicas: List<String>.from(data['caracteristicas'] ?? []),
      localizacao: data['localizacao'] ?? '',
      anunciante: anunciante, // Passando o anunciante
      biografia: data['biografia'] ?? '',
    );
  }

  // Método para buscar todos os pets do Firestore
  static Future<List<Pet>> buscarPets() async {
    try {
      final petCollection = FirebaseFirestore.instance.collection('pets');
      final querySnapshot = await petCollection.get();
      final pets =
          querySnapshot.docs.map((doc) => Pet.fromFirestore(doc)).toList();
      return pets;
    } catch (e) {
      print('Erro ao buscar os pets: $e');
      return [];
    }
  }
}
