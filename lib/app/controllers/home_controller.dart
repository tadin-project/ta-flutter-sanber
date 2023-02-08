import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isShowSideNav = false.obs;

  @override
  void dispose() {
    Get.delete<HomeController>();
    super.dispose();
  }

  void showSideNav({bool? isShow}) {
    if (isShow != null) {
      isShowSideNav.value = isShow;
    } else {
      isShowSideNav.value = !isShowSideNav.value;
    }
  }
}
