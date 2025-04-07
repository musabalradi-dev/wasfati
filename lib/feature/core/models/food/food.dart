class FoodModel {

  int? id;
  String? title;
  String? image;
  String? categories;
  String? ingredients;
  String? preparationTime;
  String? instructions;

  // Constructor
  FoodModel({
    this.id,
    this.title,
    this.image,
    this.categories,
    this.ingredients,
    this.preparationTime,
    this.instructions,
  });


  // Factory constructor to create an instance of FoodModel from JSON
  FoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image_url'];
    categories = json['categories'];
    ingredients = json['ingredients'];
    preparationTime = json['preparation_time'];
    instructions = json['instructions'];
  }


  // Method to convert an instance of FoodModel to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['categories'] = categories;
    data['ingredients'] = ingredients;
    data['preparation_time'] = preparationTime;
    data['instructions'] = instructions;
    return data;
  }
}