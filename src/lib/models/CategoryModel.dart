class CategoryModel {
  CategoryModel({
    required this.id,
    required this.userId,
    required this.categories,
  });
  late final String id;
  late final String userId;
  late final List<Categories> categories;
  
  CategoryModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['userId'];
    categories = List.from(json['categories']).map((e)=>Categories.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['userId'] = userId;
    _data['categories'] = categories.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Categories {
  Categories({
    required this.id,
    required this.title,
    required this.icon,
    required this.subCategories,
  });
  late final String id;
  late final String title;
  late final String icon;
  late final List<SubCategories> subCategories;
  
  Categories.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    icon = json['icon'];
    subCategories = List.from(json['subCategories']).map((e)=>SubCategories.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['icon'] = icon;
    _data['subCategories'] = subCategories.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class SubCategories {
  SubCategories({
    required this.id,
    required this.title,
    required this.icon,
  });
  late final String id;
  late final String title;
  late final String icon;
  
  SubCategories.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['icon'] = icon;
    return _data;
  }
}