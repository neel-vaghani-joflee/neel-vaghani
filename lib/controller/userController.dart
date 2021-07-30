import 'package:get/get.dart';
import 'package:tiny_expence/Model/ExpensesModel.dart';

class UserController extends GetxController {
  Rx<ExpensesModel> usersList = ExpensesModel(users: []).obs;
}
