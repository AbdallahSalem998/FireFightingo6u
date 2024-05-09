class SensorModel {
  static const String COLLECTION_NAME = "Sensors";
  String? smoke;
  String? gas;
  String? heat;
  String? flame;
  bool? Door;
  bool? Window;
  bool? Electricity;
  bool? Gas;
  bool? Alarm;
  SensorModel({
    required this.Door,
    required this.Window,
    required this.Electricity,
    required this.Gas,
    required this.Alarm,
  });

  SensorModel.fromJson(Map<String, dynamic> json) {
    smoke = json['smoke'];
    gas = json['gas'];
    heat = json['heat'];
    flame = json['flame'];
  }

  Map<String, dynamic> toJson() {
    return {
      // "smoke": smoke,
      // "gas": gas,
      // "heat": heat,
      // "flame": flame,
      "Door": Door,
      "Window": Window,
      "Electricity": Electricity,
      "Gas": Gas,
      "Alarm": Alarm,
    };
  }
}
