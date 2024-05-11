class SensorModel {
  static const String COLLECTION_NAME = "Sensors";
  // String? smoke;
  // String? gas;
  // String? heat;
  // String? flame;
  // bool? Door;
  // bool? Window;
  // bool? Electricity;
  // bool? Gas;
  // bool? Alarm;
  // SensorModel({
  //   required this.Door,
  //   required this.Window,
  //   required this.Electricity,
  //   required this.Gas,
  //   required this.Alarm,
  // });
  //
  // SensorModel.fromJson(Map<String, dynamic> json) {
  //   smoke = json['smoke'];
  //   gas = json['gas'];
  //   heat = json['heat'];
  //   flame = json['flame'];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     // "smoke": smoke,
  //     // "gas": gas,
  //     // "heat": heat,
  //     // "flame": flame,
  //     "Door": Door,
  //     "Window": Window,
  //     "Electricity": Electricity,
  //     "Gas": Gas,
  //     "Alarm": Alarm,
  //   };
  // }

  SensorModel({
    required this.flame,
    required this.smoke,
    required this.gas,
    required this.heat,
  });

  SensorModel.fromJson(Map<String, Object?> json)
      : this(
    flame: json['irflame']! as double,
    smoke: json['mq135']! as double,
    gas: json['mq5']! as double,
    heat: json['ds18b20']! as double,
  );

  final double flame;
  final double smoke;
  final double gas;
  final double heat;

  Map<String, Object?> toJson() {
    return {
      //     "Door": Door,
      //     "Window": Window,
      //     "Electricity": Electricity,
      //     "Gas": Gas,
      //     "Alarm": Alarm,
      'irflame': flame,
      'mq135': smoke,
      'mq5': gas,
      'ds18b20': heat,
    };
  }
}
