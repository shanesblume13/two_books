// This class is used by Reader and Author
// and could serve as a super to those in the future
class Person {
  final String id;
  final String name;
  final String email;

  Person({
    required this.id,
    required this.name,
    required this.email,
  });

  Person.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'] ?? 'Unknown Reader',
        email = json['email'] ?? 'Unknown Email';
}
