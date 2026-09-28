import 'package:flutter/material.dart';
import '../models/animals_data.dart';
import 'detail.dart';
import 'login.dart';


class HomePage extends StatelessWidget {
  final String nama; // diterima dari LoginPage (passing data)
  const HomePage({super.key, required this.nama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Halo, $nama!',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              // Logout: hapus semua stack lalu kembali ke login
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: dummyAnimals.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(animalIndex: index),
                ),
              );
            },
            child: Card(
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.antiAlias,
              child: Row(
                children: [
                
                  Image.network(
                    dummyAnimals[index].image,
                    width: 110,
                    height: 110,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 110,
                      height: 110,
                      color: Colors.grey[300],
                      child: const Icon(Icons.pets, color: Colors.grey),
                    ),
                  ),
                
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dummyAnimals[index].name,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(Icons.category, size: 16, color: Colors.green),
                              const SizedBox(width: 4),
                              Text(dummyAnimals[index].type),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.park, size: 16, color: Colors.green),
                              const SizedBox(width: 4),
                              Expanded(
                                // join() menggabungkan List<String> jadi satu teks
                                child: Text(
                                  dummyAnimals[index].habitat.join(', '),
                                  style: const TextStyle(color: Colors.black54),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
