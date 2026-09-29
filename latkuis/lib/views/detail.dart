import 'package:flutter/material.dart';
import '../models/animals_data.dart';


class DetailPage extends StatelessWidget {
  final int animalIndex;
  const DetailPage({super.key, required this.animalIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Hewan',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              dummyAnimals[animalIndex].image,
              width: double.infinity,
              height: 280,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 280,
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(Icons.pets, size: 60, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama & tipe
                  Text(
                    dummyAnimals[animalIndex].name,
                    style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Chip(
                    label: Text(dummyAnimals[animalIndex].type),
                    avatar: const Icon(Icons.category, size: 18),
                  ),
                  const SizedBox(height: 16),

                  // Berat & tinggi
                  Row(
                    children: [
                      Expanded(
                        child: _infoCard(
                          Icons.monitor_weight,
                          'Berat',
                          '${dummyAnimals[animalIndex].weight} kg',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _infoCard(
                          Icons.height,
                          'Tinggi',
                          '${dummyAnimals[animalIndex].height} cm',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

 
                  const Text(
                    'Habitat',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: dummyAnimals[animalIndex].habitat
                        .map((item) => Chip(
                              label: Text(item),
                              avatar: const Icon(Icons.park, size: 18),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    'Aktivitas',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: dummyAnimals[animalIndex].activities
                        .map((item) => Chip(
                              label: Text(item),
                              avatar: const Icon(Icons.directions_run, size: 18),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _infoCard(IconData icon, String label, String value) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Icon(icon, color: Colors.green, size: 30),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
