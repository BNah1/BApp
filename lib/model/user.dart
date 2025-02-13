class User{
  String _name;
  String _email;
  String _image;
  int _id;

  User(this._name, this._email, this._image, this._id);

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

}