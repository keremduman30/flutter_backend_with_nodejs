class PostListModel {
  String? id;
  String? postTitle;
  String? postExplain;
  String? createdAt;
  String? updatedAt;
  String? sV;

  PostListModel({this.id, this.postTitle, this.postExplain, this.createdAt, this.updatedAt, this.sV});

  PostListModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    postTitle = json['postTitle'];
    postExplain = json['postExplain'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    sV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = id;
    data['postTitle'] = postTitle;
    data['postExplain'] = postExplain;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = sV;
    return data;
  }
}

/*
class UserModel {
  String sId;
  String adSoyad;
  String tel;
  String email;
  String sifre;
  String createdAt;
  String updatedAt;
  String sV;

  UserModel(
      {this.sId,
      this.adSoyad,
      this.tel,
      this.email,
      this.sifre,
      this.createdAt,
      this.updatedAt,
      this.sV});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
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
    data['_id'] = this.sId;
    data['adSoyad'] = this.adSoyad;
    data['tel'] = this.tel;
    data['email'] = this.email;
    data['sifre'] = this.sifre;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.sV;
    return data;
  }
}

 */