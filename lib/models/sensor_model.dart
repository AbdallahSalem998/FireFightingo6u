class SensorModel {
  // static const String COLLECTION_NAME = "Sensors";
  String? smoke;
  String? gas;
  String? heat;
  String? flame;

  SensorModel({
    required this.smoke,
    required this.gas,
    required this.heat,
    required this.flame,
  });

  SensorModel.fromJson(Map<String, dynamic> json) {
    smoke = json['smoke'];
    gas = json['gas'];
    heat = json['heat'];
    flame = json['flame'];
  }

  Map<String, dynamic> toJson() {
    return {
      "smoke": smoke,
      "gas": gas,
      "heat": heat,
      "flame": flame,
    };
  }
}
