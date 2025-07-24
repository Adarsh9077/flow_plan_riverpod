class UserModal {
  final int id;
  final int isVerified;

  UserModal({required this.id, required this.isVerified});

  factory UserModal.fromJson(Map<String, dynamic> json) =>
      UserModal(id: json["id"], isVerified: json["isVerified"]);

  Map<String, dynamic> toJson() => {"id": id, "isVerified": isVerified};
}
