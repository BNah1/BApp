
import 'package:bapp/core/constant/app_color.dart';
import 'package:bapp/core/constant/app_text.dart';
import 'package:bapp/core/constant/enum.dart';
import 'package:flutter/material.dart';

import 'package:bapp/feature/edit_image/widget/edit_selected_contain/canvas_selected_contain.dart';
import 'package:bapp/feature/edit_image/widget/edit_selected_contain/filter_selected_contain.dart';
import 'package:bapp/feature/edit_text/widget/text_selected_contain.dart';


class EditButtonRow extends StatefulWidget {
  const EditButtonRow({super.key});

  @override
  State<EditButtonRow> createState() => _EditButtonRowState();
}

class _EditButtonRowState extends State<EditButtonRow> {
  EnumEdit selectedEdit = EnumEdit.crop;
  final List<EnumEdit> listEnum = EnumEdit.values;

  void _navigateEdit(bool isNext){
    int currentIndex = listEnum.indexOf(selectedEdit);
    if(currentIndex == listEnum.length - 1 && isNext){
      selectedEdit = listEnum[0];
    } else if(currentIndex == 0 && !isNext){
      selectedEdit = listEnum[listEnum.length -1];
    } else {
      selectedEdit = isNext ? listEnum[currentIndex +1] : listEnum[currentIndex -1];
    }
  }


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
              InkWell(
                  onTap: (){
                    setState(() {
                      _navigateEdit(false);
                    });
                  },
                  child: const Icon(Icons.turn_left_outlined,size: 30,)),
              Text(selectedEdit.name,style: AppTextStyle.textTitle,),
              InkWell(
                  onTap: (){
                    setState(() {
                      _navigateEdit(true);
                    });
                  },
                  child: const Icon(Icons.turn_right_outlined,size: 30)),
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
              _button('Crop', Icons.crop,EnumEdit.crop ),
              _button('Canvas', Icons.pets_outlined,EnumEdit.canvas),
              _button('Filters', Icons.incomplete_circle,EnumEdit.filters),
              _button('Effect', Icons.brightness_low_outlined,EnumEdit.effect),
              _button('Text', Icons.text_fields_outlined,EnumEdit.text),
              _button('Frame', Icons.filter_frames,EnumEdit.frame),
            ],
          ),
        ],
      ),
    );
  }

  void _changeWidget(EnumEdit edit){
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
        return const TextSelectedContain();
      case EnumEdit.frame:
        return const Text('frame',);
      }
  }

  Widget _button(String text, IconData icon, EnumEdit selected){
    return InkWell(
      onTap: () => {
        _changeWidget(selected)
      },
      child: Column(
        children: [
          Icon(icon,color: selected == selectedEdit ? Colors.red : AppColors.black,size: 30,),
          Text(text,style: TextStyle(color: selected == selectedEdit ? Colors.red : AppColors.black),),
        ],
      ),
    );
  }

}

