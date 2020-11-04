

class Details {

  String name;
  String email;
  String phone;
  String address;

  Details();

  Details.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        address = json['address'],
        phone = json['phone'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'email': email,
        'address' : address,
        'phone' : phone
      };
}
