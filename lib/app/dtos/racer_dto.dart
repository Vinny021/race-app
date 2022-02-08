class Racer {
  final String name;
  final int number;

  Racer({this.name, this.number});

  Map<String, dynamic> toJson() {
    return {'name': this.name, 'number': this.number};
  }

  Racer fromJson(Map<String, dynamic> json) {
    return Racer(name: json['name'], number: json['number']);
  }
}
