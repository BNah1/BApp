import 'package:bapp/UI/Widget/user_info/user_avatar_circle.dart';
import 'package:bapp/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Constant/constant.dart';
import '../../../Constant/data_test.dart';
import '../../../model/user.dart';

class ListUserHome extends StatefulWidget {
  const ListUserHome({super.key});

  @override
  State<ListUserHome> createState() => _ListUserHomeState();
}

class _ListUserHomeState extends State<ListUserHome> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
        future: getListUser(),
        builder: (context, snapshot) {
          return CheckSnapshot(
              snapshot,
          (data)=> Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dicovery',
                style: TextCustom.textTitle,
              ),
              // Avatar
              SizedBox(
                height: 100,
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return UserAvatarCircle(
                      image: data[index].image,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 15,
                    );
                  },
                  itemCount: data.length,
                  scrollDirection: Axis.horizontal,
                ),
              )
            ],
          ));
        });
  }
}
