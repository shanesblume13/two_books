class Reader {
  final String id;

  Reader({
    required this.id,
  });

  Reader.fromJson(Map<String, dynamic> json) : id = json['id'];
}
