import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/home_page_container_model.dart';

/// A provider class for the HomePageContainerScreen.
///
/// This provider manages the state of the HomePageContainerScreen, including the
/// current homePageContainerModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class HomePageContainerProvider extends ChangeNotifier {
  HomePageContainerModel homePageContainerModelObj = HomePageContainerModel();

  @override
  void dispose() {
    super.dispose();
  }
}
