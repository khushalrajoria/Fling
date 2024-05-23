import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/productcard_item_model.dart';
import '../models/purchase_drawer_model.dart';

/// A provider class for the PurchaseDrawerScreen.
///
/// This provider manages the state of the PurchaseDrawerScreen, including the
/// current purchaseDrawerModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class PurchaseDrawerProvider extends ChangeNotifier {
  PurchaseDrawerModel purchaseDrawerModelObj = PurchaseDrawerModel();

  @override
  void dispose() {
    super.dispose();
  }
}
