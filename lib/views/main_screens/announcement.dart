import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/my_drawer.dart';
import '../settings.dart';

class Announcement extends StatelessWidget {
  const Announcement({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.sort),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text('Announcement'),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const Settings());
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      // Drawer
      drawer: const MyDrawer(),
      body: const Center(
        child: Text('Hello'),
      ),
    );
  }
}
