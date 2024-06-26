class Location {
    final String name;
    final String region;
    final String country;
    final String localtime;

    Location({
        required this.name,
        required this.region,
        required this.country,
        required this.localtime,
    });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        country: json['country'],
        name: json['name'],
        localtime: json['localtime'],
        region: json['region'],
      );

}