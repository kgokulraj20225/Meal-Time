class Music_App {
  dynamic id;
  dynamic name;
  dynamic bio;
  dynamic artistImage;

  Music_App({this.id, this.name, this.bio, this.artistImage});

  Music_App.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bio = json['bio'];
    artistImage = json['Artist_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['bio'] = this.bio;
    data['Artist_image'] = this.artistImage;
    return data;
  }
}
