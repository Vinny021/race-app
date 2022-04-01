class VoltaTempo {
  int volta;
  DateTime tempo;

  VoltaTempo({this.volta, this.tempo});

  Map<String, dynamic> toJson() {
    return {'volta': this.volta, 'tempo': this.tempo.toString()};
  }

  VoltaTempo fromJson(Map<String, dynamic> json) {
    return VoltaTempo(
        volta: json['volta'], tempo: DateTime.parse(json['tempo']));
  }
}
