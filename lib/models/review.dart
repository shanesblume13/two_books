class Review {
  final String id;

  Review({
    required this.id,
  });

  Review.fromJson(Map<String, dynamic> json) : id = json['id'];
}
