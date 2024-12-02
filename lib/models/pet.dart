import 'package:pet_amigo/models/anunciante.dart';

class Pet {
  final String nome;
  final String idade;
  final String imagem;
  final String genero;
  final List<String> caracteristicas;
  final String localizacao;
  final Anunciante anunciante;  // Propriedade para armazenar o anunciante

  Pet({
    required this.nome,
    required this.idade,
    required this.imagem,
    required this.genero,
    required this.caracteristicas,
    required this.localizacao,
    required this.anunciante,  // Passando o anunciante no construtor
  });

  // Método estático para buscar pets
  static List<Pet> buscarPets() {
    return [
      Pet(
        nome: 'Max',
        idade: '2 anos',
        imagem: 'assets/pets/max.png',
        genero: 'Macho',
        caracteristicas: [
          'Energético', 'Amigável', 'Leal', 'Curioso', 'Protetor', 
          'Carinhoso', 'Brincalhão', 'Ativo'
        ],
        localizacao: 'São Paulo, SP',
        anunciante: Anunciante(
          nome: 'Carlos Silva',
          numero: '1234-5678',
          email: 'carlos@example.com',
          condicao: 'Pet saudável, pronto para adoção.',
        ),
      ),
      Pet(
        nome: 'Tina',
        idade: '3 anos',
        imagem: 'assets/pets/tina.png',
        genero: 'Fêmea',
        caracteristicas: [
          'Brincalhona', 'Afeituosa', 'Social', 'Inteligente', 'Carinhosa',
          'Fiel', 'Companheira', 'Gentil'
        ],
        localizacao: 'Rio de Janeiro, RJ',
        anunciante: Anunciante(
          nome: 'Ana Souza',
          numero: '9876-5432',
          email: 'ana@example.com',
          condicao: 'Pet vacinada, excelente companheira.',
        ),
      ),
      Pet(
        nome: 'Juninho',
        idade: '1 ano',
        imagem: 'assets/pets/juninho.png',
        genero: 'Macho',
        caracteristicas: [
          'Curioso', 'Leal', 'Protetor', 'Ativo', 'Carinhoso', 
          'Brincalhão', 'Inteligente', 'Sociável'
        ],
        localizacao: 'Belo Horizonte, MG',
        anunciante: Anunciante(
          nome: 'João Oliveira',
          numero: '9988-7766',
          email: 'joao@example.com',
          condicao: 'Pet castrado, amigável e tranquilo.',
        ),
      ),
      Pet(
        nome: 'Tyler',
        idade: '4 anos',
        imagem: 'assets/pets/tyler.png',
        genero: 'Macho',
        caracteristicas: [
          'Protetor', 'Inteligente', 'Atento', 'Fiel', 'Carinhento',
          'Leal', 'Brincalhão', 'Energetico'
        ],
        localizacao: 'Curitiba, PR',
        anunciante: Anunciante(
          nome: 'Fernanda Costa',
          numero: '5544-3322',
          email: 'fernanda@example.com',
          condicao: 'Pet com boa saúde, precisa de espaço para correr.',
        ),
      ),
      Pet(
        nome: 'Fred',
        idade: '5 anos',
        imagem: 'assets/pets/fred.png',
        genero: 'Macho',
        caracteristicas: [
          'Calmo', 'Gentil', 'Aconchegante', 'Fiel', 'Amigável',
          'Tranquilo', 'Sociável', 'Educado'
        ],
        localizacao: 'Porto Alegre, RS',
        anunciante: Anunciante(
          nome: 'Pedro Lima',
          numero: '1122-3344',
          email: 'pedro@example.com',
          condicao: 'Pet muito tranquilo, ideal para apartamento.',
        ),
      ),
      Pet(
        nome: 'Polly',
        idade: '2 anos',
        imagem: 'assets/pets/polly.png',
        genero: 'Fêmea',
        caracteristicas: [
          'Ativa', 'Feliz', 'Alegre', 'Social', 'Amigável',
          'Brincalhona', 'Inteligente', 'Leal'
        ],
        localizacao: 'Florianópolis, SC',
        anunciante: Anunciante(
          nome: 'Mariana Santos',
          numero: '6655-4433',
          email: 'mariana@example.com',
          condicao: 'Pet com muita energia, precisa de passeios diários.',
        ),
      ),
      Pet(
        nome: 'Thor',
        idade: '3 anos',
        imagem: 'assets/pets/thor.png',
        genero: 'Macho',
        caracteristicas: [
          'Forte', 'Leal', 'Protetor', 'Fiel', 'Brincalhão',
          'Inteligente', 'Aventureiro', 'Ativo'
        ],
        localizacao: 'Fortaleza, CE',
        anunciante: Anunciante(
          nome: 'Ricardo Gomes',
          numero: '2211-8899',
          email: 'ricardo@example.com',
          condicao: 'Pet muito protetor, ótimo para famílias.',
        ),
      ),
      Pet(
        nome: 'Julie',
        idade: '1 ano',
        imagem: 'assets/pets/julie.png',
        genero: 'Fêmea',
        caracteristicas: [
          'Carinhosa', 'Brincalhona', 'Sociável', 'Afetuosa', 'Alegre',
          'Amigável', 'Leal', 'Feliz'
        ],
        localizacao: 'Recife, PE',
        anunciante: Anunciante(
          nome: 'Luciana Pereira',
          numero: '9988-1122',
          email: 'luciana@example.com',
          condicao: 'Pet muito carinhosa, excelente para crianças.',
        ),
      ),
      Pet(
        nome: 'Beto',
        idade: '6 anos',
        imagem: 'assets/pets/beto.png',
        genero: 'Macho',
        caracteristicas: [
          'Experiente', 'Amoroso', 'Tranquilo', 'Aconchegante', 'Fiel',
          'Calmo', 'Companheiro', 'Gentil'
        ],
        localizacao: 'Salvador, BA',
        anunciante: Anunciante(
          nome: 'Gustavo Rocha',
          numero: '3344-5566',
          email: 'gustavo@example.com',
          condicao: 'Pet idoso, mas com boa saúde e muito amoroso.',
        ),
      ),
    ];
  }
}
