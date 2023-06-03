class Article {
  final int id;
  final String header;
  final Category categories;
  final String image;
  final int time_to_read;
  final DateTime creationDate;

  Article({
    required this.id,
    required this.header,
    required this.categories,
    required this.image,
    required this.time_to_read,
    required this.creationDate,
  });
}

class Category {
  final int id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });
}
