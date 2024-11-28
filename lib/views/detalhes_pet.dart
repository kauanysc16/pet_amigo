import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Importa o pacote do Google Maps
import 'package:geocoding/geocoding.dart'; // Importa o pacote de geocodificação
import 'package:pet_amigo/controllers/pet_controller.dart';
import 'package:pet_amigo/models/pet.dart';

class DetalhePet extends StatefulWidget {
  final Pet pet;

  const DetalhePet({super.key, required this.pet});

  @override
  _DetalhePetState createState() => _DetalhePetState();
}

class _DetalhePetState extends State<DetalhePet> {
  final PetController controller = PetController();
  bool isFavorite = false; // Variável para controlar o estado de favorito
  String? petLocalizacao; // Variável para armazenar o endereço
  late GoogleMapController mapController;
  late CameraPosition _initialPosition;
  late final anunciante =
      controller.anunciante; // Declaração da variável 'anunciante'

  @override
  void initState() {
    super.initState();
    _getEndereco(); // Chama a função para obter o endereço ao iniciar
    _initialPosition = CameraPosition(
      target: LatLng(widget.pet.latitude, widget.pet.longitude),
      zoom: 14.0,
    );
  }

  // Função para realizar a geocodificação reversa
  Future<void> _getEndereco() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        widget.pet.latitude,
        widget.pet.longitude,
      );
      if (placemarks.isNotEmpty) {
        setState(() {
          petLocalizacao =
              "${placemarks[0].locality}, ${placemarks[0].administrativeArea}";
        });
      }
    } catch (e) {
      print("Erro ao obter o endereço: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final pet = widget.pet; // Usando o 'pet' passado para o widget

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Animal'),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
              size: 28.0,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Imagem
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      pet.imagem,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Nome e idade do animal
                  Center(
                    child: Text(
                      '${pet.nome} - ${pet.idade} anos',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Gênero do animal
                  Center(
                    child: Text(
                      'Gênero: ${pet.genero}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Mapa
                  Text(
                    "Localização no Mapa",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 300,
                    child: GoogleMap(
                      initialCameraPosition: _initialPosition,
                      onMapCreated: (GoogleMapController controller) {
                        mapController = controller;
                      },
                      markers: {
                        Marker(
                          markerId: const MarkerId('petLocation'),
                          position: LatLng(pet.latitude, pet.longitude),
                          infoWindow: InfoWindow(title: pet.nome),
                        ),
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Características
                  Text(
                    "Características",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: pet.caracteristicas
                        .map(
                          (caracteristica) => Chip(
                            label: Text(
                              caracteristica,
                              style: const TextStyle(color: Colors.black),
                            ),
                            backgroundColor: const Color(0xFFB6EB7A),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 24),
                  // Anunciante
                  Text(
                    "Anunciante: ${anunciante?.nome ?? 'Desconhecido'}", // Se 'anunciante' for null, exibe 'Desconhecido'
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Localização textual
                  Text(
                    "Localização",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  petLocalizacao != null
                      ? Text(
                          petLocalizacao!,
                          style: const TextStyle(fontSize: 16),
                        )
                      : const CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
