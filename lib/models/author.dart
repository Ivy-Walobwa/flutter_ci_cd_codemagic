class Author {
  final String name;
  final String slug;
  final String description;
  final String id;

  Author({
    required this.slug,
    required this.name,
    required this.description,
    required this.id,
  });

  Author.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        slug = json['slug'],
        description = json['description'],
        id = json['_id'];

}
