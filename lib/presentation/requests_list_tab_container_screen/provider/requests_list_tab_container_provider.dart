import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/requests_list_tab_container_model.dart';

/// A provider class for the RequestsListTabContainerScreen.
///
/// This provider manages the state of the RequestsListTabContainerScreen, including the
/// current requestsListTabContainerModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class RequestsListTabContainerProvider extends ChangeNotifier {
  RequestsListTabContainerModel requestsListTabContainerModelObj =
      RequestsListTabContainerModel();

  @override
  void dispose() {
    super.dispose();
  }
}
