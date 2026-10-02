//Seth Baal
//ITSE-2343

class Pokemon {
  final String name;
  final String picture;

  const Pokemon({required this.name, required this.picture});

  //convert json response to pokemon object -- factory is a more in-depth version of a constructor
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "name": String name,
        "sprites": {"other": {"home": {"front_default": String picture}}},
      } =>
        Pokemon(name: name, picture: picture),
      _ => throw const FormatException('Failed to load Pokemon!'),
    };
  }
}
