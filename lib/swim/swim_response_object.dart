class SwimResponse {
  late bool boolValue;
  late SwimResponseObject swimResponseObject;

  SwimResponse({
    required this.boolValue,
    required this.swimResponseObject,
  });

  SwimResponse.fromJson(Map<String, dynamic> json) {
    boolValue = json['brs_strt'];
    swimResponseObject = SwimResponseObject.fromJson(json['bk_json']);
  }
}

class SwimResponseObject {
  String? kkj;
  String? yya;
  String? iis;
  String? oop;

  SwimResponseObject({this.kkj, this.yya, this.iis, this.oop});

  SwimResponseObject.fromJson(Map<String, dynamic> json) {
    kkj = json['kkj'];
    yya = json['yya'];
    iis = json['iis'];
    oop = json['oop'];
  }
}
