import '../models/user.dart'; // Importa o modelo User, que provavelmente contém a definição da classe User.

class AuthController {
  // Uma lista privada de usuários que será utilizada para armazenar os usuários cadastrados.
  static final List<User> _users = [];

  // Método estático para registrar um novo usuário.
  // Este método recebe um objeto User e o adiciona à lista de usuários.
  static void registerUser(User user) {
    _users.add(user);
  }

  // Método estático para verificar o login de um usuário.
  // Este método recebe o CPF e a senha do usuário e retorna true se as credenciais corresponderem a um usuário na lista.
  // Caso contrário, retorna false.
  static bool login(String cpf, String password) {
    for (var user in _users) {
      if (user.cpf == cpf && user.password == password) {
        return true;
      }
    }
    return false;
  }

  // Método estático para retornar os dados de um usuário com base no CPF.
  // Este método recebe o CPF do usuário e retorna o objeto User correspondente, se encontrado.
  // Caso contrário, retorna null.
  static User? getUserByCPF(String cpf) {
    try {
      // Tenta encontrar o primeiro usuário cujo CPF corresponda ao CPF fornecido.
      return _users.firstWhere((user) => user.cpf == cpf);
    } catch (e) {
      // Caso nenhum usuário seja encontrado, captura a exceção e retorna null.
      return null;
    }
  }
}
