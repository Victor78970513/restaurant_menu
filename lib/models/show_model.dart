class ShowModel {
  int? idFuncion;
  String? nombre;
  String? descripcion;
  String? fecha;
  String? hora;
  num? precioEntrada;
  String? imagen;
  ShowModel({
    this.idFuncion,
    this.nombre,
    this.descripcion,
    this.fecha,
    this.hora,
    this.precioEntrada,
    this.imagen,
  });

  ShowModel.fromJson(Map<String, dynamic> json) {
    idFuncion = json['id_funcion'];
    nombre = json['nombre'];
    descripcion = json['descripcion'];
    fecha = json['fecha'];
    hora = json['hora'];
    precioEntrada = json['precio_entrada'];
    imagen = json['imagen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id_funcion'] = idFuncion;
    data['nombre'] = nombre;
    data['descripcion'] = descripcion;
    data['fecha'] = fecha;
    data['hora'] = hora;
    data['precio_entrada'] = precioEntrada;
    data['imagen'] = imagen;
    return data;
  }
}
