class CategoryModel {
  CategoryModel({
    required this.id,
    required this.userId,
    required this.categories,
  });
  late final String id;
  late final String userId;
  late final List<Category> categories;
  
  CategoryModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['userId'];
    categories = List.from(json['categories']).map((e)=>Category.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['categories'] = categories.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Category {
  Category({
    required this.id,
    required this.title,
    required this.icon,
    required this.subCategories,
  });
  late final String id;
  late final String title;
  late final String icon;
  late final List<SubCategory> subCategories;
  
  Category.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    icon = json['icon'];
    subCategories = List.from(json['subCategories']).map((e)=>SubCategory.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['icon'] = icon;
    data['subCategories'] = subCategories.map((e)=>e.toJson()).toList();
    return data;
  }
}

class SubCategory {
  SubCategory({
    required this.id,
    required this.title,
    required this.icon,
  });
  late final String id;
  late final String title;
  late final String icon;
  
  SubCategory.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['icon'] = icon;
    return data;
  }
}