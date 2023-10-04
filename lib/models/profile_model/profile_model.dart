import 'dart:convert';

class ProfileModel {
  DateTime? createdAt;
  String? name;
  String? avatar;
  String? phone;
  String? id;

  ProfileModel({
    this.createdAt,
    this.name,
    this.avatar,
    this.phone,
    this.id,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> data) => ProfileModel(
        createdAt: data['createdAt'] == null
            ? null
            : DateTime.parse(data['createdAt'] as String),
        name: data['name'] as String?,
        avatar: data['avatar'] as String?,
        phone: data['phone'] as String?,
        id: data['id'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'createdAt': createdAt?.toIso8601String(),
        'name': name,
        'avatar': avatar,
        'phone': phone,
        'id': id,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProfileModel].
  factory ProfileModel.fromJson(String data) {
    return ProfileModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProfileModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
