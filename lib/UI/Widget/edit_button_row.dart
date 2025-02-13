import 'package:bapp/Constant/constant.dart';
import 'package:bapp/UI/Widget/edit_selected_contain/canvas_selected_contain.dart';
import 'package:flutter/material.dart';

import 'edit_selected_contain/filter_selected_contain.dart';

class EditButtonRow extends StatefulWidget {
  const EditButtonRow({super.key});

  @override
  State<EditButtonRow> createState() => _EditButtonRowState();
}

class _EditButtonRowState extends State<EditButtonRow> {
  EnumEdit selectedEdit = EnumEdit.none;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Column(
        children: [
          // title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.turn_left_outlined,size: 30,),
              Text(selectedEdit.name,style: TextCustom.textTitle,),
              const Icon(Icons.turn_right_outlined,size: 30),
            ],
          ),

          //action show
          Expanded(child: Center(
            child: getWidgetSelected(selectedEdit),
          )),
          //button row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _Button('Crop', Icons.crop,EnumEdit.crop ),
              _Button('Canvas', Icons.pets_outlined,EnumEdit.canvas),
              _Button('Filters', Icons.incomplete_circle,EnumEdit.filters),
              _Button('Effect', Icons.brightness_low_outlined,EnumEdit.effect),
              _Button('Text', Icons.text_fields_outlined,EnumEdit.text),
              _Button('Frame', Icons.filter_frames,EnumEdit.frame),
            ],
          ),
        ],
      ),
    );
  }

  void _ChangeWidget(EnumEdit edit){
    setState(() {
      selectedEdit = edit;
    });
  }

  Widget getWidgetSelected(EnumEdit select){
    switch(select){
      case EnumEdit.crop:
        return  const Text('crop',);
      case EnumEdit.canvas:
        return const CanvasSelectedContain();
      case EnumEdit.filters:
        return const FilterSelectedContain();
      case EnumEdit.effect:
        return const Text('effect',);
      case EnumEdit.text:
        return const Text('text',);
      case EnumEdit.frame:
        return const Text('frame',);
      case EnumEdit.none:
        return const SizedBox.shrink();
      default :
        return const SizedBox.shrink();
    }
  }

  Widget _Button(String text, IconData icon, EnumEdit selected){
    return InkWell(
      onTap: () => {
        _ChangeWidget(selected)
      },
      child: Column(
        children: [
          Icon(icon,color: selected == selectedEdit ? Colors.red : AppColor.black,size: 30,),
          Text(text,style: TextStyle(color: selected == selectedEdit ? Colors.red : AppColor.black),),
        ],
      ),
    );
  }

}

