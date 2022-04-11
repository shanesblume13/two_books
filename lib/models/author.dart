// TODO extend person class
class Author {
  final String id;
  final String name;

  Author({
    required this.id,
    required this.name,
  });

  // TODO Figure out if we want to use a factory or not
  Author.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}
