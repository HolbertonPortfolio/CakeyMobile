class Pastry {
  final int id;
  final String name;
  final String description;
  final String imageUrl;

  Pastry({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory Pastry.fromJson(Map<String, dynamic> json) {
    return Pastry(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_url'],
    );
  }
}
