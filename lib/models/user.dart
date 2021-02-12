class User {
  int id;
  String name;
  String email;
  String password;

  User({this.id, this.email, this.name, this.password});


  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
    );
  }

}