import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AnimatedListController extends GetxController {
  RxDouble topPadding = 15.0.obs;
  final duration = const Duration(milliseconds: 300);

  scrollUpdated(ScrollMetrics metrics) {
    if (topPadding.value == 25.0) return;
    topPadding.value = 25.0;
  }

  scrollEnded(ScrollMetrics metrics) {
    topPadding.value = 15;
  }
}
