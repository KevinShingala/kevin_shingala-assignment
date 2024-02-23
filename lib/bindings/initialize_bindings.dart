import 'package:kevin_assignment/controller/login_controller.dart';
import 'package:kevin_assignment/controller/register_controller.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<RegisterController>(() => RegisterController(), fenix: true);
  }
}
