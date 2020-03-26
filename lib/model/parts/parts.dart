class Parts {
  final List<Part> parts;

  Parts({this.parts});

  factory Parts.fromJson(List<dynamic> jsonResponse) {
    List<Part> parts = new List<Part>();

    parts = jsonResponse
        .map<Part>((jsonResponse) => Part.fromJson(jsonResponse))
        .cast<Part>()
        .toList();

    return new Parts(
      parts: parts,
    );
  }
}

class Part {
  final String name;
  final double price;
  final String brand;
  final String model;
  final String url;

  Part({this.name, this.price, this.brand, this.model, this.url});

  factory Part.fromJson(Map<String, dynamic> json) {
    return new Part(
      name: json["name"],
      price: json["price"],
      brand: json["brand"],
      model: json["model"],
      url: json["url"],
    );
  }
}
