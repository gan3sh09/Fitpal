class UpdateUser {
  String id;
  final String firstName;
  final String lastName;
  final String body;
  final String height;
  final String weight;
  final String calory;

  UpdateUser({
    this.id = '',
    required this.firstName,
    required this.lastName,
    required this.body,
    required this.height,
    required this.weight,
    required this.calory,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'body': body,
        'height': height,
        'weight': weight,
        'calory': calory,
      };

  static UpdateUser fromJson(Map<String, dynamic> json) => UpdateUser(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        body: json['body'],
        height: json['height'],
        weight: json['weight'],
        calory: json['calory'],
      );
}
