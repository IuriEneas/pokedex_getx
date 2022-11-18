import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/pages/base/controller/base_controller.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final controller = Get.find<BaseController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Stack(
            children: [
              const SizedBox(
                width: 800,
                child: DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: SizedBox(
                    height: 20,
                  ),
                ),
              ),
              Image.network(
                'https://http2.mlstatic.com/D_NQ_NP_798060-MLB44315207251_122020-O.jpg',
                height: 171,
              ),
              const Positioned(
                bottom: 30,
                left: 15,
                child: CircleAvatar(
                  radius: 40,
                  child: Icon(
                    Icons.person_outlined,
                    size: 45,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomListTile(
            index: 0,
            icon: Icons.home_max_outlined,
            title: 'Pokedéx',
            onTap: () {
              setState(() {
                controller.currentIndex.value = 0;
                Get.back();
              });
            },
          ),
          CustomListTile(
            index: 1,
            icon: Icons.circle_outlined,
            title: 'Meus pokemon',
            onTap: () {
              setState(() {
                controller.currentIndex.value = 1;
                Get.back();
              });
            },
          ),
          CustomListTile(
            index: 2,
            icon: Icons.auto_graph_outlined,
            title: 'Estatísticas',
            onTap: () {
              setState(() {
                controller.currentIndex.value = 2;
                Get.back();
              });
            },
          ),
          CustomListTile(
            index: 3,
            icon: Icons.backpack_outlined,
            title: 'Inventário',
            onTap: () {
              setState(() {
                controller.currentIndex.value = 3;
                Get.back();
              });
            },
          ),
          const SizedBox(height: 80),
          CustomListTile(
            index: 4,
            icon: Icons.logout,
            title: 'Logout',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  CustomListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.index,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final int index;
  final VoidCallback onTap;

  final controller = Get.find<BaseController>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: controller.currentIndex.value == index ? Colors.red : null,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: controller.currentIndex.value == index ? Colors.red : null,
        ),
      ),
    );
  }
}
