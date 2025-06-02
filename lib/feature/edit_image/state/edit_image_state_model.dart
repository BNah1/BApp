class EditImageStateModel {
  String id;
  double? aspectRatio;
  double? brightness;
  double? saturation;
  String? effect;
  String? fontText;
  String? frame;

  EditImageStateModel({required this.id,
    this.aspectRatio = 1,
    this.brightness = 0,
    this.saturation = 0,
    this.effect,
    this.fontText,
    this.frame});

  EditImageStateModel copyWith({ String? id,
    double? aspectRatio,
    double? brightness,
    double? saturation,
    String? effect,
    String? fontText,
    String? frame,
  }) {
    return EditImageStateModel(
      id: id ?? this.id,
      aspectRatio: aspectRatio ?? this.aspectRatio,
      brightness: brightness ?? this.brightness,
      saturation: saturation ?? this.saturation,
      effect: effect ?? this.effect,
      fontText: fontText ?? this.fontText,
      frame: frame ?? this.frame,
    );
  }

}
