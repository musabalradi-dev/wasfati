class CategoriesModel{
  int? id;
  String? image;
  String? title;

  // Constructor
  CategoriesModel({this.id, this.image, this.title});

  // Factory constructor to create an instance of Categories Model from JSON
  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image_url'];
    title = json['title'];
  }


  // Method to convert an instance of Categories Model to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image_url'] = image;
    data['title'] = title;
    return data;
  }
}