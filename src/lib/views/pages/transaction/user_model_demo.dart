class UserDemo {
  String name;
  String email;

  UserDemo(this.name, this.email);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }
}

List<UserDemo> userDemoList = [
  UserDemo("Nguyen Duc Hung", 'pandakig@gmail.com'),
  UserDemo('Hoang Nhu Vinh', 'vinh123@gmail.com'),
  UserDemo("Nguyen Truc Nhu Binh", "test25@gmail.com"),
  UserDemo("Huynh Huu Phuc", "huuphucst123@gmail.com"),
  UserDemo("Tu Canh Minh", "tcm123@gmail.com")

];
