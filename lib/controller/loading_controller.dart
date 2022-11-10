import 'package:get/get.dart';

class Loading extends GetxController {
  final loading = false.obs;

  void setState({required state}) {
    loading(state);
  }
}
