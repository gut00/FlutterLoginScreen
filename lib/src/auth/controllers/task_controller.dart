import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myapp/src/auth/components/item.dart';

class TaskController extends GetxController {
  var descripitionTaksText = Rx(TextEditingController());
  var checkTask = RxBool(false);
  var listingItems = RxList([Items(title: '', check: false)]);

  @override
  void onInit() {
    listingItems.value.removeWhere((element) => element.title.isEmpty);
    super.onInit();
  }
}
