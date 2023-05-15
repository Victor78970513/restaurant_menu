class PlatosModel {
  int? idComida;
  String? nombre;
  String? descripcion;
  int? precio;
  int? idSeccion;
  String? imagen;
  PlatosModel({
    this.idComida,
    this.nombre,
    this.descripcion,
    this.precio,
    this.idSeccion,
    this.imagen,
  });

  PlatosModel.fromJson(Map<String, dynamic> json) {
    idComida = json['idComida'];
    nombre = json['nombre'];
    descripcion = json['descripcion'];
    precio = json['precio'];
    idSeccion = json['idSeccion'];
    imagen = json['imagen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['idComida'] = idComida;
    data['nombre'] = nombre;
    data['descripcion'] = descripcion;
    data['precio'] = precio;
    data['idSeccion'] = idSeccion;
    data['imagen    '] = imagen;
    return data;
  }
}
// // To parse this JSON data, do
// //
// //     final platosModel = platosModelFromMap(jsonString);

// import 'dart:convert';

// class PlatosModel {
//   final int idComida;
//   final String nombre;
//   final String descripcion;
//   final int precio;
//   final int idSeccion;
//   final String imagen;

//   PlatosModel({
//     required this.idComida,
//     required this.nombre,
//     required this.descripcion,
//     required this.precio,
//     required this.idSeccion,
//     required this.imagen,
//   });

//   factory PlatosModel.fromJson(String str) =>
//       PlatosModel.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory PlatosModel.fromMap(Map<String, dynamic> json) => PlatosModel(
//         idComida: json["id_comida"],
//         nombre: json["nombre"],
//         descripcion: json["descripcion"],
//         precio: json["precio"],
//         idSeccion: json["id_seccion"],
//         imagen: json["imagen"],
//       );

//   Map<String, dynamic> toMap() => {
//         "id_comida": idComida,
//         "nombre": nombre,
//         "descripcion": descripcion,
//         "precio": precio,
//         "id_seccion": idSeccion,
//         "imagen": imagen,
//       };
// }
