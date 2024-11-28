import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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

 
  // Método para obter a localização do pet
  Future<LatLng> getPetLocation(String localizacao) async {
    List<Location> locations = await locationFromAddress(localizacao);
    return LatLng(locations[0].latitude, locations[0].longitude);
  }
}
