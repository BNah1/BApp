import 'package:flutter/material.dart';
import 'package:bapp/constant/constant.dart';

import 'package:bapp/feature/edit_image/widget/edit_selected_contain/canvas_selected_contain.dart';
import 'package:bapp/feature/edit_image/widget/edit_selected_contain/filter_selected_contain.dart';
import 'package:bapp/feature/edit_text/widget/text_selected_contain.dart';

class EditButtonRow extends StatefulWidget {
  const EditButtonRow({super.key});

  @override
  State<EditButtonRow> createState() => _EditButtonRowState();
}

class _EditButtonRowState extends State<EditButtonRow> {
  EnumEdit selectedEdit = EnumEdit.Crop;
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
              Text(selectedEdit.name,style: fTextCustom.textTitle,),
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
              _Button('Crop', Icons.crop,EnumEdit.Crop ),
              _Button('Canvas', Icons.pets_outlined,EnumEdit.Canvas),
              _Button('Filters', Icons.incomplete_circle,EnumEdit.Filters),
              _Button('Effect', Icons.brightness_low_outlined,EnumEdit.Effect),
              _Button('Text', Icons.text_fields_outlined,EnumEdit.Text),
              _Button('Frame', Icons.filter_frames,EnumEdit.Frame),
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
      case EnumEdit.Crop:
        return  const Text('crop',);
      case EnumEdit.Canvas:
        return const CanvasSelectedContain();
      case EnumEdit.Filters:
        return const FilterSelectedContain();
      case EnumEdit.Effect:
        return const Text('effect',);
      case EnumEdit.Text:
        return const TextSelectedContain();
      case EnumEdit.Frame:
        return const Text('frame',);
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
          Icon(icon,color: selected == selectedEdit ? Colors.red : fAppColor.black,size: 30,),
          Text(text,style: TextStyle(color: selected == selectedEdit ? Colors.red : fAppColor.black),),
        ],
      ),
    );
  }

}

