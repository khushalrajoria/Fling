import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/home_model.dart';

// ignore_for_file: must_be_immutable
class HomeProvider extends ChangeNotifier {
  HomeModel homeModelObj = HomeModel();

  @override
  void dispose() {
    super.dispose();
  }
}
