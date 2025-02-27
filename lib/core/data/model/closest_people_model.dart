class ClosestPersonModel {
  final String name;
  final String phone;
  final String address;

  ClosestPersonModel({
    required this.name,
    required this.phone,
    required this.address,
  });

  factory ClosestPersonModel.fromJson(Map<String, dynamic> json) {
    return ClosestPersonModel(
      name: json['name'] ?? 'Unknown',
      phone: json['phone'] ?? 'No phone',
      address: json['address'] ?? 'No address',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
      "address": address,
    };
  }
}
