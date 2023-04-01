class NoteDatabaseModel {
  late final int? id;
  late final String title;
  late final String icerik;

  NoteDatabaseModel({this.id, required this.title, required this.icerik});

  NoteDatabaseModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    icerik = json['icerik'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['icerik'] = icerik;
    return data;
  }
}
