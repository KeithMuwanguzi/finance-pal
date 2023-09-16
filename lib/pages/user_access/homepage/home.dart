import 'package:finance_pal/pages/user_access/homepage/home_cont.dart';
import 'package:finance_pal/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
        body: ListView.builder(
            itemCount: controller.items.length,
            itemBuilder: ((context, index) {
              return Card(
                child: Column(
                  children: [
                    TextWidget(
                        size: 14,
                        text: controller.items[index].title,
                        bold: false)
                  ],
                ),
              );
            })));
  }
}
