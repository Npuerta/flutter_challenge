class HeadlinesSource {
    final String id;
    final String name;
    final String description;
    final String url;
    final String category;
    final String language;
    final String country;

    HeadlinesSource({
        required this.id,
        required this.name,
        required this.description,
        required this.url,
        required this.category,
        required this.language,
        required this.country,
    });

      factory HeadlinesSource.fromJson(Map<String, dynamic> json) => HeadlinesSource(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        url: json['url'],
        category: json['category'],
        language: json['language'],
        country: json['country']
      );


}