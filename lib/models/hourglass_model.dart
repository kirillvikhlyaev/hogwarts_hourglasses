class HourglassModel {
  final int id;
  final String name;
  int score;

  HourglassModel({
    required this.id,
    required this.name,
    required this.score,
  });

  HourglassModel.fromJSON(Map<String, dynamic> json)
      : id = int.parse(json["Id"]),
        name = json["Name"],
        score = int.parse(json["Score"] == ""
            ? "0"
            : json["Score"]); // в случае потери данных присвоится 0

  Map<String, dynamic> toJSON() => {
        "Name": name,
        "Score": score.toString(),
      };
}
