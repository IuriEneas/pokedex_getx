import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/pages/base/controller/base_controller.dart';
import 'package:pokedex_getx/routes/page_routes.dart';
import 'package:pokedex_getx/services/notification_service.dart';
import 'package:provider/provider.dart';

class MyPokemonController extends GetxController {
  final CollectionReference pokemonRef =
      FirebaseFirestore.instance.collection('myPokemon');

  late DocumentSnapshot documentSnapshot;
  late QuerySnapshot querySnapshot;

  final controller = Get.find<BaseController>();

  void getPokemon() async {}

  @override
  void onInit() {
    checkNotifications();
    super.onInit();
  }

  showNotification() {
    Provider.of<NotificationService>(Get.context as BuildContext, listen: false)
        .showNotificationScheduled(
      CustomNotification(
        id: 1,
        title: 'Um novo pokemón apareceu',
        body:
            'Um novo pokemón apareceu, venha captura-lo antes que seja tarde 😍',
        payload: PagesRoute.splashRoute,
      ),
      const Duration(seconds: 5),
    );
  }

  checkNotifications() async {
    await Provider.of<NotificationService>(
      Get.context as BuildContext,
      listen: false,
    ).checkForNotifications();
  }
}
