// TODO extend person class
class Publisher {
  final String id;
  final String name;

  Publisher({
    required this.id,
    required this.name,
  });

  // TODO Figure out if we want to use a factory or not
  Publisher.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}
