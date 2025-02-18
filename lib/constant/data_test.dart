import 'package:bapp/Constant/constant.dart';
import 'package:bapp/model/user.dart';

List<User> listUserTest = [
  User("aaa", "bbb", ImageUrl.plashImage, 1),
  User("aaa", "bbb", ImageUrl.avatar4, 1),
  User("aaa", "bbb", ImageUrl.avatar1, 1),
  User("aaa", "bbb", ImageUrl.avatar2, 1),
  User("aaa", "bbb", ImageUrl.avatar3, 1),
  User("aaa", "bbb", ImageUrl.avatar1, 1),
  User("aaa", "bbb", ImageUrl.plashImage, 1),
  User("aaa", "bbb", ImageUrl.avatar2, 1),
  User("aaa", "bbb", ImageUrl.avatar3, 1),
  User("aaa", "bbb", ImageUrl.avatar1, 1),
];

List<String> listImage = [
  ImageUrl.avatar1,
  ImageUrl.avatar2,
  ImageUrl.avatar3,
  ImageUrl.avatar4,
  ImageUrl.avatar3,
  ImageUrl.avatar1,
  ImageUrl.avatar2,
  ImageUrl.avatar1,
  ImageUrl.avatar2,
  ImageUrl.avatar3,
  ImageUrl.avatar4,
  ImageUrl.avatar3,
  ImageUrl.avatar1,
  ImageUrl.avatar2,
  ImageUrl.avatar1,
  ImageUrl.avatar2,
  ImageUrl.avatar3,
  ImageUrl.avatar4,
  ImageUrl.avatar3,
  ImageUrl.avatar1,
  ImageUrl.avatar2,
];




Future<List<User>> getListUser() async {
  await Future.delayed(Duration(seconds: 1));
  return listUserTest;
}

Future<List<String>> getImgage() async {
  await Future.delayed(Duration(seconds: 1));
  return listImage;
}
