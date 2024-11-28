import 'package:flutter/material.dart';
import 'package:pet_amigo/models/pet.dart';
import 'package:pet_amigo/views/detalhes_pet.dart';

class PetSearchDelegate extends SearchDelegate {
  final List<Pet> pets;

  PetSearchDelegate({required this.pets});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Limpa a busca
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Fecha a busca
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Pet> resultados = pets
        .where((pet) => pet.nome.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: resultados.length,
      itemBuilder: (context, index) {
        final pet = resultados[index];
        return ListTile(
          title: Text(pet.nome),
          subtitle: Text(pet.idade),
          onTap: () {
            close(context, null); // Fecha a busca
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetalhePet(
                    pet: pet), // Redireciona para a página de detalhes
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Pet> sugestoes = pets
        .where((pet) => pet.nome.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: sugestoes.length,
      itemBuilder: (context, index) {
        final pet = sugestoes[index];
        return ListTile(
          title: Text(pet.nome),
          onTap: () {
            query = pet.nome; // Atualiza a pesquisa com o nome do pet
            showResults(context); // Exibe os resultados
          },
        );
      },
    );
  }
}

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF17706E),
        title: const Text('Bem-vindo ao PetAmigo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: PetSearchDelegate(pets: Pet.buscarPets()));
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF17706E),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Início'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            ListTile(
              leading: const Icon(Icons.app_registration),
              title: const Text('Cadastro'),
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: AspectRatio(
                aspectRatio: 1450 / 350,
                child: Image.asset(
                  'assets/images/header.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB6EB7A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Quero Adotar',
                    style: TextStyle(
                      color: Color(0xFF17706E),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB6EB7A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Quero Divulgar',
                    style: TextStyle(
                      color: Color(0xFF17706E),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: [
                FilterChip(
                  label: const Text('Espécie'),
                  onSelected: (bool selecionado) {},
                  backgroundColor: const Color(0xFFB6EB7A),
                ),
                FilterChip(
                  label: const Text('Raça'),
                  onSelected: (bool selecionado) {},
                  backgroundColor: const Color(0xFFB6EB7A),
                ),
                FilterChip(
                  label: const Text('Local'),
                  onSelected: (bool selecionado) {},
                  backgroundColor: const Color(0xFFB6EB7A),
                ),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  color: const Color(0xFF17706E),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 10),
            const GridDePets(), // Aqui chamamos a grid de pets
          ],
        ),
      ),
    );
  }
}

class CartaoPet extends StatelessWidget {
  final Pet pet;

  const CartaoPet({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 4,
      color: const Color(0xFFFFAB6B),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                pet.imagem, // Exibe a imagem do pet
                fit: BoxFit.cover, // A imagem se ajusta ao tamanho do container
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            pet.nome,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF17706E),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            pet.idade,
            style: const TextStyle(
              color: Color(0xFF17706E),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                pet.genero == 'Macho' ? Icons.male : Icons.female,
                color: pet.genero == 'Macho' ? Colors.blue : Colors.pink,
                size: 16,
              ),
              const SizedBox(width: 5),
              Text(
                pet.genero,
                style: const TextStyle(
                  color: Color(0xFF17706E),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {
              // Redireciona para a tela de detalhes do pet
              Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetalhePet(pet: pet),  // Passando o objeto pet corretamente
  ),
);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFB6EB7A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Adote-Me',
              style: TextStyle(
                color: Color(0xFF17706E),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class GridDePets extends StatelessWidget {
  const GridDePets({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap:
          true, // Impede o grid de rolar dentro do SingleChildScrollView
      physics:
          const NeverScrollableScrollPhysics(), // Impede rolagem dentro do Grid
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: Pet.buscarPets().length,
      itemBuilder: (context, index) {
        return CartaoPet(pet: Pet.buscarPets()[index]);
      },
    );
  }
}