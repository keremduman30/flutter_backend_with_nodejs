// ignore_for_file: prefer_collection_literals

class UserModel {
  String? id;
  String? adSoyad;
  String? tel;
  String? email;
  String? sifre;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserModel({id, adSoyad, tel, email, sifre, createdAt, updatedAt, iV});

  UserModel.fromJson(Map<String, dynamic>? json) {
    id = json?['_id'];
    adSoyad = json?['adSoyad'];
    tel = json?['tel'];
    email = json?['email'];
    sifre = json?['sifre'];
    createdAt = json?['createdAt'];
    updatedAt = json?['updatedAt'];
    iV = json?['__v'];
  }

  Map<String, dynamic>? toJson() {
    final Map<String, dynamic>? data = Map<String, dynamic>();
    data?['_id'] = id;
    data?['adSoyad'] = adSoyad;
    data?['tel'] = tel;
    data?['email'] = email;
    data?['sifre'] = sifre;
    data?['createdAt'] = createdAt;
    data?['updatedAt'] = updatedAt;
    data?['__v'] = iV;
    return data;
  }
}
