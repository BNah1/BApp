
import 'package:bapp/model/image/image_model.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

final getIt = GetIt.instance;

 Future<void> initHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ImageModelAdapter());
  var box = await Hive.openBox<ImageModel>('edited_images');

  getIt.registerSingleton<Box<ImageModel>>(box);
}

Future<void> initMain()async {

}