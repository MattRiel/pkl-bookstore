import 'package:get/get.dart';

SnackbarController warningDev() {
  return Get.snackbar(
    "Peringatan",
    "Fitur ini masih dalam tahap pengembangan",
    duration: Duration(seconds: 2),
    animationDuration: Duration(milliseconds: 300),
  );
}
