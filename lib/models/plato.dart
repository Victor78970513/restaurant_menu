import 'dart:convert';

class PlatoResponse {
  final int idComida;
  final String nombre;
  final String descripcion;
  final int precio;
  final int idSeccion;
  final String imagen;

  PlatoResponse({
    required this.idComida,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.idSeccion,
    required this.imagen,
  });

  factory PlatoResponse.fromJson(String str) =>
      PlatoResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlatoResponse.fromMap(Map<String, dynamic> json) => PlatoResponse(
        idComida: json["id_comida"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        idSeccion: json["id_seccion"],
        imagen: json["imagen"],
      );

  Map<String, dynamic> toMap() => {
        "id_comida": idComida,
        "nombre": nombre,
        "descripcion": descripcion,
        "precio": precio,
        "id_seccion": idSeccion,
        "imagen": imagen,
      };
}

List<PlatoResponse> platosFromJson(String str) => List<PlatoResponse>.from(
    json.decode(str).map((x) => PlatoResponse.fromMap(x)));

String platosToJson(List<PlatoResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));
