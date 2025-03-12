
class User {
  String? id;
  String? email;
  String? password;
  User({
    this.id,
   required this.email,
    required this.password,
   
  });
  factory User.fromJson(Map<String, dynamic> json) {
   
    return User(
      id: json['uid'],
      email: json['email'] ,
      password: json['password']
      
    );
  }
  Map<String, dynamic> toJson() {
    

    return {
  
      'username': email,
      'password': password,
     
    };
  }
}


