class Recipe {
  final String title;
  final String image;
  final String ingredients;
  final String steps;

  Recipe({
    required this.title,
    required this.image,
    required this.ingredients,
    required this.steps,
  });

  // Contoh list resep sebagai data dummy
  static List<Recipe> getSampleRecipes() {
    return [
      Recipe(
        title: 'Nasi Goreng',
        image: 'https://via.placeholder.com/150',
        ingredients: 'Nasi, Telur, Bawang, Kecap',
        steps:
            '1. Panaskan minyak. 2. Tumis bawang. 3. Masukkan nasi dan kecap. 4. Aduk hingga merata.',
      ),
      Recipe(
        title: 'Mie Goreng',
        image: 'https://via.placeholder.com/150',
        ingredients: 'Mie, Telur, Bawang, Sayur',
        steps:
            '1. Rebus mie. 2. Tumis bawang. 3. Masukkan mie dan sayur. 4. Aduk hingga matang.',
      ),
    ];
  }
}
