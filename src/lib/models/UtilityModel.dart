/*

* This file contains foundational model classes that are shared by other model classes.

*/

class TransactionInfo {
  TransactionInfo({
    required this.id,
  });
  late final String id;
  
  TransactionInfo.fromJson(Map<String, dynamic> json){
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    return _data;
  }
}

class Member {
  Member({
    required this.id,
  });
  late final String id;
  
  Member.fromJson(Map<String, dynamic> json){
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    return _data;
  }
}

class Wallet {
  Wallet({
    required this.id,
  });
  late final String id;
  
  Wallet.fromJson(Map<String, dynamic> json){
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    return _data;
  }
}