class Picture{
  final String id;
  final String iconName;

  Picture({this.id, this.iconName});

  factory Picture.fromJson(Map<String, dynamic> json){
    return Picture(
        id: json["temperature"],
      iconName: json["iconName"]
    );
  }
}