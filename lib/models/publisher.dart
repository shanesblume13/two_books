class Publisher {
  final String id;
  final String name;

  Publisher({
    required this.id,
    required this.name,
  });

  Publisher.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'] ?? 'Unknown Publisher';
}
