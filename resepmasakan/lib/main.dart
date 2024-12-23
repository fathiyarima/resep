import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resep Masakan',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gambar latar belakang
          Positioned.fill(
            child: Image.asset(
              'images/background.jpg', // Ganti dengan gambar latar yang sesuai
              fit: BoxFit.cover,
            ),
          ),
          // Konten utama
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Aplikasi Resep Masakan',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: const Color.fromARGB(255, 109, 6, 6),
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Temukan berbagai resep masakan yang mudah diikuti.',
                    style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 255, 123, 71)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      // Aksi untuk pergi ke halaman daftar resep
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecipeListPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Warna tombol
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    child: Text(
                      'Lihat Daftar Resep',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeListPage extends StatelessWidget {
  final List<Map<String, String>> recipes = [
    {
      'title': 'Nasi Goreng',
      'image': 'images/nasgor.jpg',
      'ingredients': 'Nasi, Telur, Bawang, Kecap',
      'steps':
          '1. Panaskan minyak. 2. Tumis bawang. 3. Masukkan nasi dan kecap. 4. Aduk hingga merata.'
    },
    {
      'title': 'Mie Goreng',
      'image': 'images/mie.jpg',
      'ingredients': 'Mie, Telur, Bawang, Sayur',
      'steps':
          '1. Rebus mie. 2. Tumis bawang. 3. Masukkan mie dan sayur. 4. Aduk hingga matang.'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Resep'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return GestureDetector(
              onTap: () {
                // Aksi untuk menavigasi ke halaman detail resep
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetailPage(
                      title: recipe['title']!,
                      ingredients: recipe['ingredients']!,
                      steps: recipe['steps']!,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Column(
                    children: [
                      // Gambar resep
                      Image.asset(
                        recipe['image']!,
                        width: double.infinity,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Judul resep
                            Text(
                              recipe['title']!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    color: Colors
                                        .orange, // Menambahkan warna oranye pada judul
                                  ),
                            ),

                            // Ikon untuk navigasi ke detail
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.orange,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          'Klik untuk melihat resep lengkap',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class RecipeDetailPage extends StatelessWidget {
  final String title;
  final String ingredients;
  final String steps;

  RecipeDetailPage({
    required this.title,
    required this.ingredients,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bahan-bahan
              Text(
                'Bahan-Bahan:',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 8),
              Text(
                ingredients,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 20),

              // Langkah-langkah
              Text(
                'Langkah-Langkah:',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 8),
              Text(
                steps,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 20),

              // Button untuk kembali
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Kembali ke Daftar Resep',
                    style: TextStyle(fontSize: 16),
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
