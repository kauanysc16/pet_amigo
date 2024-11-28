class Anunciante {
  final String nome;
  final String numero;
  final String email;
  final String condicao;

  Anunciante({
    required this.nome,
    required this.numero,
    required this.email,
    required this.condicao,
  });

  // Método para criar um Anunciante a partir de um documento Firestore
  factory Anunciante.fromFirestore(Map<String, dynamic> data) {
    return Anunciante(
      nome: data['nome'] ?? '',
      numero: data['numero'] ?? '',
      email: data['email'] ?? '',
      condicao: data['condicao'] ?? '',
    );
  }
}
