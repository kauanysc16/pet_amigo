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
      biografia: 'Max é um cachorro super energético e cheio de amor para dar. Ele adora brincar e correr pelos parques, sendo um ótimo companheiro para famílias ativas. Leal e carinhoso, Max é o amigo ideal para quem busca um pet enérgico e amoroso.',
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
      biografia: 'Tina é uma cachorrinha adorável e cheia de personalidade. Ela adora interagir com outros animais e pessoas, e é muito carinhosa com sua família. Inteligente e leal, Tina será uma excelente companhia para quem busca um pet sociável e amigável.',
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
      biografia: 'Juninho é um cachorrinho curioso e sociável, sempre pronto para explorar o mundo ao seu redor. Apesar de ser muito ativo, ele também adora momentos de carinho e é extremamente leal aos seus donos. Juninho é o parceiro ideal para quem gosta de aventuras.',
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
      biografia: 'Tyler é um cachorro inteligente e protetor, sempre atento ao ambiente ao seu redor. Com energia de sobra, ele adora correr e brincar. Leal e carinhoso, Tyler é o guardião perfeito para sua família, sempre pronto para defender quem ele ama.',
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
      biografia: 'Fred é um cachorro tranquilo e educado, ideal para quem busca um companheiro calmo e afetuoso. Sociável e muito amigável, ele se adapta bem a ambientes urbanos e é perfeito para quem vive em apartamento. Seu comportamento gentil e seu caráter fiel fazem dele um excelente amigo.',
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
      biografia: 'Polly é uma cachorrinha cheia de energia e alegria. Sempre animada, ela adora brincar e fazer novos amigos. Se você busca um pet ativo e sociável, Polly é a escolha perfeita. Com seu comportamento amigável, ela será uma excelente companhia para qualquer família.',
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
      biografia: 'Thor é um cachorro forte e protetor, sempre pronto para defender sua família. Com um espírito aventureiro, ele adora explorar o mundo ao seu redor. Leal e brincalhão, Thor é o parceiro ideal para famílias que buscam um cão protetor e ativo.',
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
      biografia: 'Julie é uma cachorrinha adorável e carinhosa. Ela adora brincar e se socializar com pessoas e outros animais. Alegre e leal, ela é a companhia perfeita para famílias com crianças, sempre pronta para dar carinho e amor.',
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
      biografia: 'Beto é um cão experiente, tranquilo e muito amoroso. Com seu comportamento calmo, ele adora momentos de aconchego e carinho. Ideal para quem busca um companheiro fiel e gentil, Beto é o pet perfeito para famílias que buscam um amigo calmo e leal.',
    ),
  ];
}
