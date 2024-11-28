import 'package:flutter/material.dart';

class AnimalFormPage extends StatelessWidget {
  const AnimalFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF17706E),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/logo.png'), // Logo do aplicativo
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Implementar a ação do menu aqui
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nome do animal',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Escreva o nome do seu pet',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Estado do Animal',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      DropdownButtonFormField<String>(
                        items: const [
                          DropdownMenuItem(
                              value: 'Machucado', child: Text('Machucado')),
                          DropdownMenuItem(
                              value: 'Saudável', child: Text('Saudável')),
                        ],
                        onChanged: null,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        hint: const Text('Selecione a Condição'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Gênero do Animal',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      DropdownButtonFormField<String>(
                        items: const [
                          DropdownMenuItem(
                              value: 'Macho', child: Text('Macho')),
                          DropdownMenuItem(
                              value: 'Fêmea', child: Text('Fêmea')),
                        ],
                        onChanged: null,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        hint: const Text('Selecione a Condição'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Carregue as imagens do animal',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: IconButton(
                  icon: const Icon(Icons.cloud_upload, size: 50),
                  onPressed: () {
                    // Implementar o upload de imagem aqui
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Sua descrição',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const TextField(
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Características do animal',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: List.generate(8, (index) {
                return Chip(
                  label: Text('Característica ${index + 1}'),
                  backgroundColor: const Color(0xFFB6EB7A),
                );
              }),
            ),
            const SizedBox(height: 16),
            const Text(
              'Localização e dados anunciante',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Adote'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Doe qualquer valor'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Divulgue um animal'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Minha página de perfil'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Cadastrar-se'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
