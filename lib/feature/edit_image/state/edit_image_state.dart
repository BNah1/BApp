import 'package:bapp/model/picture.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_image_state.g.dart';

@riverpod
class EditImageState extends _$EditImageState {
  @override
  Picture build() => Picture();

  void setBrightness(double brightness) {
    state = state.copyWith(brightness: brightness);
  }

  void setSaturation(double saturation) {
    state = state.copyWith(saturation: saturation);
  }
}
