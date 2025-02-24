class Picture {
  final double brightness;
  final double saturation;

  Picture({this.brightness = 0, this.saturation = 0}); // trang den

  Picture copyWith({double? brightness, double? saturation}) {
    return Picture(
      brightness: brightness ?? this.brightness,
      saturation: saturation ?? this.saturation,
    );
  }
}
