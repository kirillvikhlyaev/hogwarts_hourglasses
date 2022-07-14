class Info {
  final int guid;
  final String deviceInfo;
  final DateTime dateTime;

  Info({
    required this.guid,
    required this.deviceInfo,
    required this.dateTime,
  });

  Info.fromJSON(Map<String, dynamic> json)
      : guid = int.parse(json["Id"] == "" ? "0" : json["Id"]),
        deviceInfo = json["DeviceInfo"],
        dateTime =
            DateTime.fromMillisecondsSinceEpoch(int.parse(json["DateTime"]));

  Map<String, dynamic> toJSON() => {
        "Id": guid.toString(),
        "DeviceInfo": deviceInfo,
        "DateTime": dateTime.millisecondsSinceEpoch.toString()
      };

  @override
  String toString() {
    return '"info": { "Id" : $guid, "DeviceInfo" : $deviceInfo, "DateTime": $dateTime }';
  }
}
