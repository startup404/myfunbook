class usermodel {
  late String email;
  late String password;

  usermodel({required this.email, required this.password});

  usermodel.fromMap(Map<String, dynamic> map) {
    this.email = map["email"];
    this.password = map["password"];
  }

  Map<String, dynamic> toMap() {
    return {"email": this.email, "password": this.password};
  }
}
