class TourPlace {
  String? uid;
  String? img;
  String? name;
  String? tag;
  String? description;

  TourPlace(
      {required this.uid,
        required this.img,
        required this.name,
        required this.tag,
        required this.description});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'uid': uid,
      'img': img,
      'name': name,
      'tag': tag,
      'description': description,
    };
    return map;
  }

  TourPlace.fromMap(Map<String, dynamic> map) {
    uid = map['uid'];
    img = map['img'];
    name = map['name'];
    tag = map['tag'];
    description = map['description'];
  }

  @override
  String toString() {
    return 'TourPlace{uid: $uid, img: $img, name: $name, tag: $tag, description: $description}';
  }
}
