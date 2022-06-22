class Qoute {
  late String qoute;

  Qoute.fromJson(Map<String, dynamic> json) {
    qoute = json['qoute'];
  }
}
