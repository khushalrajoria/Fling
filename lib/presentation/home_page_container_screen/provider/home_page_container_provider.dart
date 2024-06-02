import 'package:flutter/material.dart';

import '../models/home_page_container_model.dart';


class HomePageContainerProvider extends ChangeNotifier {
  HomePageContainerModel homePageContainerModelObj = HomePageContainerModel();

  @override
  void dispose() {
    super.dispose();
  }
}
