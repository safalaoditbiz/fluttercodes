class login2 {
  String phonenumber;
  String otp;

  login2({
    this.phonenumber,
    this.otp,
  });

  factory login2.fromJson(Map<String, dynamic> json) {
    return login2(
      phonenumber: json["phonenumber"],
      otp: json["otp"],
    );
  }
}
