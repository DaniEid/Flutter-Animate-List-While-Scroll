import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'animated_list_controller.dart';

class AnimatedListScreen extends StatelessWidget {
  final String title;

  AnimatedListScreen({Key? key, required this.title}) : super(key: key);

  final AnimatedListController controller = Get.put(AnimatedListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: customAnimatedList,
    );
  }

  Widget get customAnimatedList => NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            controller.scrollUpdated(scrollNotification.metrics);
          } else if (scrollNotification is ScrollEndNotification) {
            controller.scrollEnded(scrollNotification.metrics);
          }
          return true;
        },
        child: ListView.builder(
          itemCount: 25,
          itemBuilder: (context, index) {
            return Obx(
              () => AnimatedPadding(
                padding: EdgeInsets.only(top: controller.topPadding.value),
                duration: controller.duration,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        color: index % 2 == 0 ? Colors.black38 : Colors.blue),
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            );
          },
        ),
      );
}
