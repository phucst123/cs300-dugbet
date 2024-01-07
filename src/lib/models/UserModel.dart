class UserModel {
  UserModel({
    required this.userId,
    required this.username,
    required this.password,
    required this.settings,
    required this.transactions,
    required this.wallets,
  });
  late final String userId;
  late final String username;
  late final String password;
  late final List<Settings> settings;
  late final List<Transactions> transactions;
  late final List<Wallets> wallets;

  UserModel.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    username = json['username'];
    password = json['password'];
    settings = List.from(json['settings']).map((e)=>Settings.fromJson(e)).toList();
    transactions = List.from(json['transactions']).map((e)=>Transactions.fromJson(e)).toList();
    wallets = List.from(json['wallets']).map((e)=>Wallets.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userId'] = userId;
    _data['username'] = username;
    _data['password'] = password;
    _data['settings'] = settings.map((e)=>e.toJson()).toList();
    _data['transactions'] = transactions.map((e)=>e.toJson()).toList();
    _data['wallets'] = wallets.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Settings {
  Settings({
    required this.section,
    this.email,
    this.name,
    this.dob,
    this.gender,
    this.pushNotification,
    this.inAppNotification,
    this.sound,
    this.vibrate,
    this.eventReminder,
    this.targetReminder,
    this.enablePin,
  });
  late final String section;
  late final String? email;
  late final String? name;
  late final String? dob;
  late final String? gender;
  late final bool? pushNotification;
  late final bool? inAppNotification;
  late final bool? sound;
  late final bool? vibrate;
  late final bool? eventReminder;
  late final bool? targetReminder;
  late final bool? enablePin;

  Settings.fromJson(Map<String, dynamic> json){
    section = json['section'];
    email = json['email'];
    name = json['name'];
    dob = json['dob'];
    gender = json['gender'];
    pushNotification = json['pushNotification'];
    inAppNotification = json['inAppNotification'];
    sound = json['sound'];
    vibrate = json['vibrate'];
    eventReminder = json['eventReminder'];
    targetReminder = json['targetReminder'];
    enablePin = json['enablePin'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['section'] = section;
    _data['email'] = email;
    _data['name'] = name;
    _data['dob'] = dob;
    _data['gender'] = gender;
    _data['pushNotification'] = pushNotification;
    _data['inAppNotification'] = inAppNotification;
    _data['sound'] = sound;
    _data['vibrate'] = vibrate;
    _data['eventReminder'] = eventReminder;
    _data['targetReminder'] = targetReminder;
    _data['enablePin'] = enablePin;
    return _data;
  }
}

class Transactions {
  Transactions({
    required this.id,
  });
  late final String id;
  
  Transactions.fromJson(Map<String, dynamic> json){
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    return _data;
  }
}

class Wallets {
  Wallets({
    required this.id,
  });
  late final String id;
  
  Wallets.fromJson(Map<String, dynamic> json){
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    return _data;
  }
}
