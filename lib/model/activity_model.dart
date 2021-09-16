class ActivityModel {
  String? activity;
  String? accessibility;
  String? type;
  int? participants;
  String? price;
  String? link;
  String? key;

  ActivityModel(
      {this.activity,
      this.accessibility,
      this.type,
      this.participants,
      this.price,
      this.link,
      this.key});

  ActivityModel.fromJson(Map<String, dynamic> json) {
    activity = json['activity'];
    accessibility = json['accessibility'].toString();
    type = json['type'];
    participants = json['participants'];
    price = json['price'].toString();
    link = json['link'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activity'] = activity;
    data['accessibility'] = accessibility;
    data['type'] = type;
    data['participants'] = participants;
    data['price'] = price;
    data['link'] = link;
    data['key'] = key;
    return data;
  }
}
