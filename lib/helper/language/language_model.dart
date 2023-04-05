class LanguageModel {
  Tr? tr;
  Tr? en;

  LanguageModel({this.tr, this.en});

  LanguageModel.fromJson(Map<String, dynamic> json) {
    tr = json['tr'] != null ? Tr.fromJson(json['tr']) : null;
    en = json['en'] != null ? Tr.fromJson(json['en']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tr != null) {
      data['tr'] = tr!.toJson();
    }
    if (en != null) {
      data['en'] = en!.toJson();
    }
    return data;
  }
}

class Tr {
  String? notlarim;
  String? notlardaAramaYap;
  String? notEkle;
  String? baslik;
  String? icerik;
  String? turkce;
  String? ingilizce;

  Tr(
      {this.notlarim,
      this.notlardaAramaYap,
      this.notEkle,
      this.baslik,
      this.icerik,
      this.turkce,
      this.ingilizce});

  Tr.fromJson(Map<String, dynamic> json) {
    notlarim = json['notlarim'];
    notlardaAramaYap = json['notlardaAramaYap'];
    notEkle = json['notEkle'];
    baslik = json['baslik'];
    icerik = json['icerik'];
    turkce = json['turkce'];
    ingilizce = json['ingilizce'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notlarim'] = notlarim;
    data['notlardaAramaYap'] = notlardaAramaYap;
    data['notEkle'] = notEkle;
    data['baslik'] = baslik;
    data['icerik'] = icerik;
    data['turkce'] = turkce;
    data['ingilizce'] = ingilizce;
    return data;
  }
}
