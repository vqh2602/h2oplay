class TV {
  List<Data>? data;

  TV({this.data});

  TV.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? group;
  String? image;
  String? name;
  String? url;

  Data({this.group, this.image, this.name, this.url});

  Data.fromJson(Map<String, dynamic> json) {
    group = json['group'];
    image = json['image'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['group'] = group;
    data['image'] = image;
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}