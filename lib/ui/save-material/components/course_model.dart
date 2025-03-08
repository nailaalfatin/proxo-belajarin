class Course {
  final String category;
  final String title;
  final double rating;
  final String imageUrl;

  Course({
    required this.category,
    required this.title,
    required this.rating,
    required this.imageUrl,
  });
}

List<Course> courses = [
  Course(
    category: "Matematika",
    title: "Fungsi, Persamaan, dan Pertidaksamaan Rasional",
    rating: 4.8,
    imageUrl: "assets/images/mtk-persamaan.png",
  ),
  Course(
    category: "Fisika",
    title: "Fluida: Statis",
    rating: 4.9,
    imageUrl: "assets/images/fisika-statis.png",
  ),
  Course(
    category: "Trigonometri",
    title: "Fungsi Trigonometri",
    rating: 4.8,
    imageUrl: "assets/images/trigonometri.png",
  ),
  Course(
    category: "Kimia",
    title: "Kesetimbangan Kimia",
    rating: 4.8,
    imageUrl: "assets/images/kimia.png",
  ),
];
