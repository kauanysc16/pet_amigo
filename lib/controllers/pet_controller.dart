import 'package:pet_amigo/models/anunciante.dart';
import 'package:pet_amigo/models/pet.dart';

class PetController {
  // Inicializando o anunciante com dados reais ou null, conforme necessário.
  Anunciante?
      anunciante; // Usando ? para permitir nulos, caso não tenha dados do anunciante no momento.
  Pet?
      pet; // Usando ? para permitir nulo, pois pode não haver um pet selecionado inicialmente.

  PetController(
      {this.anunciante, this.pet}); // Construtor para inicializar com dados.

  // Método estático para buscar pets
  static List<Pet> buscarPets() {
    return [
      Pet(
        nome: 'Max',
        idade: '2 anos',
        imagem: 'assets/pets/max.png',
        genero: 'Macho',
        caracteristicas: ['Energético', 'Amigável'],
        localizacao: 'São Paulo, SP',
        latitude: -23.550520, // Latitude de São Paulo
        longitude: -46.633308, // Longitude de São Paulo
      ),
      Pet(
        nome: 'Tina',
        idade: '3 anos',
        imagem: 'assets/pets/tina.png',
        genero: 'Fêmea',
        caracteristicas: ['Brincalhona', 'Afeituosa'],
        localizacao: 'Rio de Janeiro, RJ',
        latitude: -22.906847, // Latitude do Rio de Janeiro
        longitude: -43.172896, // Longitude do Rio de Janeiro
      ),
      Pet(
        nome: 'Juninho',
        idade: '1 ano',
        imagem: 'assets/pets/juninho.png',
        genero: 'Macho',
        caracteristicas: ['Curioso', 'Leal'],
        localizacao: 'Belo Horizonte, MG',
        latitude: -19.919126, // Latitude de Belo Horizonte
        longitude: -43.934572, // Longitude de Belo Horizonte
      ),
      Pet(
        nome: 'Tyler',
        idade: '4 anos',
        imagem: 'assets/pets/tyler.png',
        genero: 'Macho',
        caracteristicas: ['Protetor', 'Inteligente'],
        localizacao: 'Curitiba, PR',
        latitude: -25.428954, // Latitude de Curitiba
        longitude: -49.267137, // Longitude de Curitiba
      ),
      Pet(
        nome: 'Fred',
        idade: '5 anos',
        imagem: 'assets/pets/fred.png',
        genero: 'Macho',
        caracteristicas: ['Calmo', 'Gentil'],
        localizacao: 'Porto Alegre, RS',
        latitude: -30.033056, // Latitude de Porto Alegre
        longitude: -51.230000, // Longitude de Porto Alegre
      ),
      Pet(
        nome: 'Polly',
        idade: '2 anos',
        imagem: 'assets/pets/polly.png',
        genero: 'Fêmea',
        caracteristicas: ['Ativa', 'Feliz'],
        localizacao: 'Florianópolis, SC',
        latitude: -27.595377, // Latitude de Florianópolis
        longitude: -48.548049, // Longitude de Florianópolis
      ),
      Pet(
        nome: 'Thor',
        idade: '3 anos',
        imagem: 'assets/pets/thor.png',
        genero: 'Macho',
        caracteristicas: ['Forte', 'Leal'],
        localizacao: 'Fortaleza, CE',
        latitude: -3.717220, // Latitude de Fortaleza
        longitude: -38.543244, // Longitude de Fortaleza
      ),
      Pet(
        nome: 'Julie',
        idade: '1 ano',
        imagem: 'assets/pets/julie.png',
        genero: 'Fêmea',
        caracteristicas: ['Carinhosa', 'Brincalhona'],
        localizacao: 'Recife, PE',
        latitude: -8.047562, // Latitude de Recife
        longitude: -34.877000, // Longitude de Recife
      ),
      Pet(
        nome: 'Beto',
        idade: '6 anos',
        imagem: 'assets/pets/beto.png',
        genero: 'Macho',
        caracteristicas: ['Experiente', 'Amoroso'],
        localizacao: 'Salvador, BA',
        latitude: -12.971398, // Latitude de Salvador
        longitude: -38.501305, // Longitude de Salvador
      ),
    ];
  }
}
