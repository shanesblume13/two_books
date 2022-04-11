class Book {
  final String id;

  Book({
    required this.id,
  });

  Book.fromJson(Map<String, dynamic> json) : id = json['id'];
}
