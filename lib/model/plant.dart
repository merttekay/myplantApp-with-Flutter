import 'dart:convert';

class Plant {
  final String name;
  final String imagePath;
  final String desc;

  Plant({
    this.name,
    this.imagePath,
    this.desc,
  });

  Plant copyWith({
    String name,
    String imagePath,
    String desc,
  }) {
    return Plant(
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      desc: desc ?? this.desc,
    );
  }

  static Map<String, dynamic> toMap(Plant plant) {
    return {
      'name': plant.name,
      'imagePath': plant.imagePath,
      'desc': plant.desc,
    };
  }

  factory Plant.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Plant(
      name: map['name'],
      imagePath: map['imagePath'],
      desc: map['desc'],
    );
  }

  String toJson() => json.encode(toMap(this));

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
      name: json['name'], desc: json['desc'], imagePath: json['imagePath']);

  @override
  String toString() => 'Plant(name: $name, imagePath: $imagePath, desc: $desc)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Plant &&
        o.name == name &&
        o.imagePath == imagePath &&
        o.desc == desc;
  }

  @override
  int get hashCode => name.hashCode ^ imagePath.hashCode ^ desc.hashCode;

  static String encode(List<Plant> musics) => json.encode(
        musics
            .map<Map<String, dynamic>>((music) => Plant.toMap(music))
            .toList(),
      );

  static List<Plant> decode(String musics) =>
      json.decode(musics).map<Plant>((item) => Plant.fromJson(item)).toList();
}
