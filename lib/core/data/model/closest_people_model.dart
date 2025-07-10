class ClosestPersonModel {
  final String name;
  final String phone;

  ClosestPersonModel({
    required this.name,
    required this.phone,
  });

  factory ClosestPersonModel.fromJson(Map<String, dynamic> json) {
    return ClosestPersonModel(
      name: json['name'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
    };
  }
}
