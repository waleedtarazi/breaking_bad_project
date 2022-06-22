class Character {
  late int charId;
  late String name;
  late String neckName;
  late String actorName;
  late List<dynamic> occupations;
  late String img;
  late String status;
  late List<dynamic> apperanceBreakingBad;
  late String catogiryForTwoSeries;
  late List<dynamic> apperanceBetterCallSoul;

  Character.fromjson(Map<String, dynamic> json) {
    charId = json["char_id"];
    name = json["name"];
    neckName = json["nickname"];
    actorName = json["portrayed"];
    occupations = json["occupation"];
    img = json["img"];
    status = json["status"];
    apperanceBetterCallSoul = json["better_call_saul_appearance"];
    apperanceBreakingBad = json["appearance"];
    catogiryForTwoSeries = json["category"];
  }
}
