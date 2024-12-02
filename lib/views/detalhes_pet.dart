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
  GoogleMapController? mapController;
  CameraPosition? _initialPosition;

  @override
  void initState() {
    super.initState();
    _loadPetLocation();
  }

  Future<void> _loadPetLocation() async {
    try {
      // Simulação de localização com base na cidade (a lógica de localização real pode ser adaptada conforme necessário)
      LatLng petLocation = await controller.getPetLocation(widget.pet.localizacao);
      setState(() {
        _initialPosition = CameraPosition(
          target: petLocation,
          zoom: 14.0,
        );
      });
    } catch (e) {
      print("Erro ao obter a localização: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final pet = widget.pet;
    final anunciante = pet.anunciante;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Animal'),
        backgroundColor: const Color(0xFFB6EB7A),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.white,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem do pet
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(16.0),
              ),
              child: Image.asset(
                pet.imagem,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            // Nome, idade e informações principais
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${pet.nome} - ${pet.idade}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4CAF50),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.person, size: 18, color: Colors.teal),
                      const SizedBox(width: 4),
                      Text(
                        'Publicado por ${anunciante?.nome ?? 'Desconhecido'}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          size: 18, color: Colors.teal),
                      const SizedBox(width: 4),
                      Text(
                        pet.localizacao ?? 'Localização não disponível',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Características
                  const Text(
                    "Características",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
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
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Mapa
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Localização no Mapa",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 200,
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
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Dados do anunciante (última seção)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Dados do Anunciante",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Nome: ${anunciante?.nome ?? 'Não informado'}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Número: ${anunciante?.numero ?? 'Não informado'}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Email: ${anunciante?.email ?? 'Não informado'}",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
