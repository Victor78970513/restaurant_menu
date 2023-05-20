class PlatosModel {
  int? idComida;
  String? nombre;
  String? descripcion;
  num? precio;
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
    idSeccion = json['id_seccion'];
    imagen = json['imagen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['idComida'] = idComida;
    data['nombre'] = nombre;
    data['descripcion'] = descripcion;
    data['precio'] = precio;
    data['id_seccion'] = idSeccion;
    data['imagen    '] = imagen;
    return data;
  }
}
