
class CategoryrOrBrandResponse {
  int? results;
  Metadata? metadata;
  List<Data>? data;
  String? statusMsg;
  String? message;

  CategoryrOrBrandResponse({this.results, this.metadata, this.data, this.statusMsg, this.message});

  CategoryrOrBrandResponse.fromJson(Map<String, dynamic> json) {
    if(json["results"] is int) {
      results = json["results"];
    }
    if(json["statusMsg"] is String) {
      statusMsg = json["statusMsg"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["metadata"] is Map) {
      metadata = json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]);
    }
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["results"] = results;
    if(metadata != null) {
      _data["metadata"] = metadata?.toJson();
    }
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.name, this.slug, this.image, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["slug"] is String) {
      slug = json["slug"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["slug"] = slug;
    _data["image"] = image;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    return _data;
  }
}

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  Metadata.fromJson(Map<String, dynamic> json) {
    if(json["currentPage"] is int) {
      currentPage = json["currentPage"];
    }
    if(json["numberOfPages"] is int) {
      numberOfPages = json["numberOfPages"];
    }
    if(json["limit"] is int) {
      limit = json["limit"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["currentPage"] = currentPage;
    _data["numberOfPages"] = numberOfPages;
    _data["limit"] = limit;
    return _data;
  }
}