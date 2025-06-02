import 'package:hive/hive.dart';

part 'image_model.g.dart';

@HiveType(typeId: 0)
class ImageModel extends HiveObject {
  @HiveField(0)
  String path;

  @HiveField(1)
  String name;

  @HiveField(2)
  DateTime createdAt;

  ImageModel({
    required this.path,
    required this.name,
    required this.createdAt,
  });
}
