// To parse this JSON data, do
//
//     final placesResponse = placesResponseFromMap(jsonString);

import 'dart:convert';

class PlacesModel {
  final String type;
  // final List<String> query;
  final List<Feature> features;
  final String attribution;

  PlacesModel({
    required this.type,
    // required this.query,
    required this.features,
    required this.attribution,
  });

  factory PlacesModel.fromJson(String str) =>
      PlacesModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlacesModel.fromMap(Map<String, dynamic> json) => PlacesModel(
        type: json["type"],
        // query: List<String>.from(json["query"].map((x) => x)),
        features:
            List<Feature>.from(json["features"].map((x) => Feature.fromMap(x))),
        attribution: json["attribution"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        // "query": List<dynamic>.from(query.map((x) => x)),
        "features": List<dynamic>.from(features.map((x) => x.toMap())),
        "attribution": attribution,
      };
}

class Feature {
  final String id;
  final String type;
  final List<String> placeType;
  final Properties properties;
  final String textEs;
  final String placeNameEs;
  final String text;
  final String placeName;
  final List<double> center;
  final Geometry geometry;
  final List<Context> context;

  Feature({
    required this.id,
    required this.type,
    required this.placeType,
    required this.properties,
    required this.textEs,
    required this.placeNameEs,
    required this.text,
    required this.placeName,
    required this.center,
    required this.geometry,
    required this.context,
  });

  factory Feature.fromJson(String str) => Feature.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Feature.fromMap(Map<String, dynamic> json) => Feature(
        id: json["id"],
        type: json["type"],
        placeType: List<String>.from(json["place_type"].map((x) => x)),
        properties: Properties.fromMap(json["properties"]),
        textEs: json["text_es"],
        placeNameEs: json["place_name_es"],
        text: json["text"],
        placeName: json["place_name"],
        center: List<double>.from(json["center"].map((x) => x?.toDouble())),
        geometry: Geometry.fromMap(json["geometry"]),
        context:
            List<Context>.from(json["context"].map((x) => Context.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "type": type,
        "place_type": List<dynamic>.from(placeType.map((x) => x)),
        "properties": properties.toMap(),
        "text_es": textEs,
        "place_name_es": placeNameEs,
        "text": text,
        "place_name": placeName,
        "center": List<dynamic>.from(center.map((x) => x)),
        "geometry": geometry.toMap(),
        "context": List<dynamic>.from(context.map((x) => x.toMap())),
      };
  @override
  String toString() {
    return 'Feature: $text';
  }
}

class Context {
  final Id? id;
  final Wikidata? wikidata;
  final MapboxId? mapboxId;
  final Texto? textEs;
  final Language? languageEs;
  final Texto? text;
  final Language? language;
  final ShortCode? shortCode;

  Context({
    required this.id,
    required this.wikidata,
    required this.mapboxId,
    required this.textEs,
    required this.languageEs,
    required this.text,
    required this.language,
    this.shortCode,
  });

  factory Context.fromJson(String str) => Context.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Context.fromMap(Map<String, dynamic> json) => Context(
        id: idValues.map[json["id"]],
        wikidata: wikidataValues.map[json["wikidata"]],
        mapboxId: mapboxIdValues.map[json["mapbox_id"]],
        textEs: textValues.map[json["text_es"]],
        languageEs: languageValues.map[json["language_es"]],
        text: textValues.map[json["text"]],
        language: languageValues.map[json["language"]],
        shortCode: shortCodeValues.map[json["short_code"]],
      );

  Map<String, dynamic> toMap() => {
        "id": idValues.reverse[id],
        "wikidata": wikidataValues.reverse[wikidata],
        "mapbox_id": mapboxIdValues.reverse[mapboxId],
        "text_es": textValues.reverse[textEs],
        "language_es": languageValues.reverse[languageEs],
        "text": textValues.reverse[text],
        "language": languageValues.reverse[language],
        "short_code": shortCodeValues.reverse[shortCode],
      };
}

enum Id { PLACE_1304606, REGION_74782, COUNTRY_8734, PLACE_780318 }

final idValues = EnumValues({
  "country.8734": Id.COUNTRY_8734,
  "place.1304606": Id.PLACE_1304606,
  "place.780318": Id.PLACE_780318,
  "region.74782": Id.REGION_74782
});

enum Language { ES }

final languageValues = EnumValues({"es": Language.ES});

enum MapboxId {
  D_X_JU_OM1_IE_H_BS_YZP_FK2_DL,
  D_X_JU_OM1_IE_H_BS_YZP_BU1_FL,
  D_X_JU_OM1_IE_H_BS_YZP_JA_DQ,
  D_X_JU_OM1_IE_H_BS_YZP_DK2_DL
}

final mapboxIdValues = EnumValues({
  "dXJuOm1ieHBsYzpBU1Fl": MapboxId.D_X_JU_OM1_IE_H_BS_YZP_BU1_FL,
  "dXJuOm1ieHBsYzpDK2dl": MapboxId.D_X_JU_OM1_IE_H_BS_YZP_DK2_DL,
  "dXJuOm1ieHBsYzpFK2dl": MapboxId.D_X_JU_OM1_IE_H_BS_YZP_FK2_DL,
  "dXJuOm1ieHBsYzpJaDQ": MapboxId.D_X_JU_OM1_IE_H_BS_YZP_JA_DQ
});

enum ShortCode { BO_L, BO }

final shortCodeValues =
    EnumValues({"bo": ShortCode.BO, "BO-L": ShortCode.BO_L});

enum Texto { NUESTRA_SEORA_DE_LA_PAZ, DEPARTAMENTO_DE_LA_PAZ, BOLIVIA, EL_ALTO }

final textValues = EnumValues({
  "Bolivia": Texto.BOLIVIA,
  "Departamento de La Paz": Texto.DEPARTAMENTO_DE_LA_PAZ,
  "El Alto": Texto.EL_ALTO,
  "Nuestra Señora de La Paz": Texto.NUESTRA_SEORA_DE_LA_PAZ
});

enum Wikidata { Q1491, Q272784, Q750, Q30996 }

final wikidataValues = EnumValues({
  "Q1491": Wikidata.Q1491,
  "Q272784": Wikidata.Q272784,
  "Q30996": Wikidata.Q30996,
  "Q750": Wikidata.Q750
});

class Geometry {
  final List<double> coordinates;
  final String type;

  Geometry({
    required this.coordinates,
    required this.type,
  });

  factory Geometry.fromJson(String str) => Geometry.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Geometry.fromMap(Map<String, dynamic> json) => Geometry(
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
        "type": type,
      };
}

class Properties {
  final String? foursquare;
  final bool? landmark;
  final String? category;
  final String? maki;
  final String? address;

  Properties({
    required this.foursquare,
    required this.landmark,
    required this.category,
    required this.maki,
    this.address,
  });

  factory Properties.fromJson(String str) =>
      Properties.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Properties.fromMap(Map<String, dynamic> json) => Properties(
        foursquare: json["foursquare"],
        landmark: json["landmark"],
        category: json["category"],
        maki: json["maki"],
        address: json["address"],
      );

  Map<String, dynamic> toMap() => {
        "foursquare": foursquare,
        "landmark": landmark,
        "category": category,
        "maki": maki,
        "address": address,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
