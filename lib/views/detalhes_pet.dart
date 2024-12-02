import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  bool isFavorite = false;
  String? petLocalizacao;
  GoogleMapController? mapController;
  CameraPosition? _initialPosition;
  final anunciante = PetController().anunciante;

  @override
  void initState() {
    super.initState();
    _loadPetLocation();
  }

  Future<void> _loadPetLocation() async {
    try {
      LatLng petLocation = await controller.getPetLocation(widget.pet.localizacao);
      setState(() {
        _initialPosition = CameraPosition(
          target: petLocation,
          zoom: 14.0,
        );
        petLocalizacao = widget.pet.localizacao;
      });
    } catch (e) {
      print("Erro ao obter a localização: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final pet = widget.pet;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Imagem do pet
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
                      // Nome e idade do pet
                      Center(
                        child: Text(
                          '${pet.nome} - ${pet.idade}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal[700],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Gênero do pet
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
                      // Localização no mapa
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
                        child: _initialPosition == null
                            ? const Center(child: CircularProgressIndicator())
                            : GoogleMap(
                                initialCameraPosition: _initialPosition!,
                                onMapCreated: (GoogleMapController controller) {
                                  mapController = controller;
                                },
                                markers: {
                                  Marker(
                                    markerId: const MarkerId('petLocation'),
                                    position: _initialPosition!.target,
                                    infoWindow: InfoWindow(title: pet.nome),
                                  ),
                                },
                              ),
                      ),
                      const SizedBox(height: 24),
                      // Características do pet
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
                        "Anunciante: ${anunciante?.nome ?? 'Desconhecido'}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal[700],
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Condição do animal
                      Text(
                        "Condição do animal: ${anunciante?.condicao ?? 'Desconhecida'}",
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
            ],
          ),
        ),
      ),
    );
  }
}
