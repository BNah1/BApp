class Test{

  // chua du lieu cua state hinh anh
  double _brightness;

  double get brightness => _brightness;

  set brightness(double value) {
    _brightness = value;
  }

  Test(this._brightness);

}