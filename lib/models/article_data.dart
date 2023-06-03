class Article {
  final int id;
  final String header;
  final String image;
  final int time_to_read;
  final String text;
  final List<Category> categories;

  Article({
    required this.id,
    required this.header,
    required this.image,
    required this.time_to_read,
    required this.text,
    required this.categories,
  });
}

class Category {
  final int id;
  final String name;

  Category({required this.id, required this.name});
}
