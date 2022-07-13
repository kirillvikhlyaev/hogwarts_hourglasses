class Info {
  final int guid;
  final String deviceInfo;

  Info({
    required this.guid,
    required this.deviceInfo,
  });

  Info.fromJSON(Map<String, dynamic> json)
      : guid = int.parse(json["Id"]),
        deviceInfo = json["DeviceInfo"];

  Map<String, dynamic> toJSON() => {"Id": guid, "DeviceInfo": deviceInfo};

  @override
  String toString() {
    return '"info": { "Id" : $guid, "DeviceInfo" : $deviceInfo }';
  }
}
