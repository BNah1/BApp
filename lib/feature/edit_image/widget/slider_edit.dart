import 'package:bapp/constant/enum.dart';
import 'package:bapp/feature/edit_image/state/edit_image_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SliderEdit extends ConsumerStatefulWidget {
  const SliderEdit(
      {super.key, required this.title, required this.editImageEffectEnum});
  final String title;
  final EditImageEffectEnum editImageEffectEnum;

  // truyen vao tham so cua state
  // sau do gan init cho no

  @override
  ConsumerState<SliderEdit> createState() => _SliderEditState();
}

class _SliderEditState extends ConsumerState<SliderEdit> {

  double getValue() {
        switch (widget.editImageEffectEnum) {
          case EditImageEffectEnum.brightness:
            return ref.watch(editImageStateProvider).brightness;
          case EditImageEffectEnum.saturation:
            return ref.watch(editImageStateProvider).saturation;
          default:
            return 0;
        }
  }

  void setValue(double value) {
    switch (widget.editImageEffectEnum) {
      case EditImageEffectEnum.brightness:
        ref.read(editImageStateProvider.notifier).setBrightness(value);
      case EditImageEffectEnum.saturation:
        ref.read(editImageStateProvider.notifier).setSaturation(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        children: [
          Text(widget.title),
          Expanded(
            child: Slider(
              value: getValue(),
              min: -1.0,
              max: 1.0,
              divisions: 20,
              label: getValue().toStringAsFixed(1),
              onChanged: (value){
                setValue(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
