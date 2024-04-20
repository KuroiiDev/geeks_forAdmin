class ResponseUserGet {
  ResponseUserGet({
      this.status, 
      this.data,});

  ResponseUserGet.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataUser.fromJson(v));
      });
    }
  }
  String? status;
  List<DataUser>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class DataUser {
  DataUser({
      this.id, 
      this.email, 
      this.profile, 
      this.name, 
      this.role, 
      this.createdAt, 
      this.updatedAt,});

  DataUser.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    profile = json['profile'];
    name = json['name'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? email;
  String? profile;
  String? name;
  String? role;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['profile'] = profile;
    map['name'] = name;
    map['role'] = role;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}