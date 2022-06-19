class Users {
  final int id;
  final String name;
  final String email;
  final String gender;
  final String status;

  const Users({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.status
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      status: json['status'] as String,

    );
  }
  
  Map<String, dynamic> toJson() => {
      'id': id,
      'name': name,
      'email':email,
      'gender': gender,
      'status': status
  };
}