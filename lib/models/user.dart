class User {
  // Declaração das propriedades da classe User.
  // Todas as propriedades são finais, o que significa que não podem ser modificadas após serem inicializadas.
  final String name;     // Nome do usuário
  final String email;    // Email do usuário
  final String cpf;      // CPF do usuário
  final String password; // Senha do usuário
  final String contact;  // Contato do usuário

  // Construtor da classe User.
  // O construtor requer que todos os parâmetros sejam fornecidos ao criar uma instância de User.
  User({
    required this.name,     // Parâmetro obrigatório para o nome
    required this.email,    // Parâmetro obrigatório para o email
    required this.cpf,      // Parâmetro obrigatório para o CPF
    required this.password, // Parâmetro obrigatório para a senha
    required this.contact,  // Parâmetro obrigatório para o contato
    required String nome,   // Parâmetro desnecessário, parece um erro (deve ser removido)
    required String contato // Parâmetro desnecessário, parece um erro (deve ser removido)
  });
}
