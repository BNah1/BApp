import 'package:flutter/material.dart';

class EditTextStateModel {
  final String id;
  final String text;
  final PositionModel position;
  final TextStyleModel style;

  const EditTextStateModel({
    required this.id,
    this.text = '',
    this.position = const PositionModel(),
    this.style = const TextStyleModel(),
  });

  EditTextStateModel copyWith({
    String? id,
    String? text,
    PositionModel? position,
    TextStyleModel? style,
  }) {
    return EditTextStateModel(
      id: id ?? this.id,
      text: text ?? this.text,
      position: position ?? this.position,
      style: style ?? this.style,
    );
  }
}


class PositionModel {
  final double left;
  final double top;
  final double right;
  final double bottom;
  final double width;
  final double height;

  const PositionModel({
    this.left = 0,
    this.top = 0,
    this.right = 0,
    this.bottom = 0,
    this.width = 0,
    this.height = 0,
  });

  PositionModel copyWith({
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? width,
    double? height,
  }) {
    return PositionModel(
      left: left ?? this.left,
      top: top ?? this.top,
      right: right ?? this.right,
      bottom: bottom ?? this.bottom,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }
}


class TextStyleModel {
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final FontStyle fontStyle;

  const TextStyleModel({
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.fontStyle = FontStyle.normal,
  });

  TextStyleModel copyWith({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    FontStyle? fontStyle,
  }) {
    return TextStyleModel(
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      color: color ?? this.color,
      fontStyle: fontStyle ?? this.fontStyle,
    );
  }
}

