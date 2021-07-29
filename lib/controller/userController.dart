import 'package:get/get.dart';
import 'package:tiny_expence/Model/model.dart';

class UserController extends GetxController {
  Rx<User> usersList = User(users: []).obs;
}
