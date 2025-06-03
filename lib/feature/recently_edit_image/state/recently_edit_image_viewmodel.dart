import 'package:bapp/core/config/di.dart';
import 'package:bapp/core/utils/storage_helper.dart';
import 'package:bapp/model/image/image_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';


final StateNotifierProvider<RecentlyEditImageViewModel,
    AsyncValue<List<ImageModel>>>
recentlyEditImageViewModel = StateNotifierProvider<
    RecentlyEditImageViewModel,
    AsyncValue<List<ImageModel>>>((ref) => RecentlyEditImageViewModel());


class RecentlyEditImageViewModel
    extends StateNotifier<AsyncValue<List<ImageModel>>> {
  RecentlyEditImageViewModel() : super(const AsyncValue.loading());
  final _imageBox = getIt<Box<ImageModel>>();


  Future<void> deleteImage(ImageModel image) async {
    try {
      state = const AsyncValue.loading();
      final loadImage = state.value?.where((e) => e.path != image.path)
          .toList();
      if (loadImage == null) {
        return;
      }
      final keyToDelete = _imageBox.keys.firstWhere(
            (key) =>
        _imageBox
            .get(key)
            ?.path == image.path,
        orElse: () => null,
      );

      if (keyToDelete != null) {
        await _imageBox.delete(keyToDelete);
      }
      state = AsyncData(loadImage);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }


  Future<void> addImage(ImageModel image) async {
    try {
      var currentList = state.value;
      state = const AsyncValue.loading();
      final newList = [...?currentList, image];
      await _imageBox.add(image);
      state = AsyncData(newList);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  Future<void> init() async {
    try {
      state = const AsyncValue.loading();
      final loadImage = await StorageHelper.getImages();
      state = AsyncData(loadImage);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
