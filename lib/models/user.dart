class User {
  int id;
  String name;
  String email;
  String password;
  String token;

  User({this.id, this.email, this.name, this.password, this.token});


  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'email': email,
      'name': name,
      'token': token
    };
  }

}