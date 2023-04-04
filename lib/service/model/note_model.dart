import 'package:mobx/mobx.dart';

class NoteDatabaseModel {
  late final int? id;
  late final String title;
  late final String icerik;
  late final String date;
  @observable
  late final int isFav;

  NoteDatabaseModel(
      {this.id,
      required this.title,
      required this.icerik,
      required this.date,
      this.isFav = 0});

  NoteDatabaseModel.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    icerik = json['icerik'];
    date = json['date'];
    isFav = json['isFav'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['icerik'] = icerik;
    data['date'] = date;
    data['isFav'] = isFav;
    return data;
  }
}
