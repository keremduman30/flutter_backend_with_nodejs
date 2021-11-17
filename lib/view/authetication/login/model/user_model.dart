class UserModel {
  String? id;
  String? adSoyad;
  String? tel;
  String? email;
  String? sifre;
  String? createdAt;
  String? updatedAt;
  String? sV;

  UserModel({this.id, this.adSoyad, this.tel, this.email, this.sifre, this.createdAt, this.updatedAt, this.sV});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    adSoyad = json['adSoyad'];
    tel = json['tel'];
    email = json['email'];
    sifre = json['sifre'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    sV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = id;
    data['adSoyad'] = adSoyad;
    data['tel'] = tel;
    data['email'] = email;
    data['sifre'] = sifre;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = sV;
    return data;
  }
}
