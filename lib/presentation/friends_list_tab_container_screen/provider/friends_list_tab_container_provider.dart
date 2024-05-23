import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/friends_list_tab_container_model.dart';

/// A provider class for the FriendsListTabContainerScreen.
///
/// This provider manages the state of the FriendsListTabContainerScreen, including the
/// current friendsListTabContainerModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class FriendsListTabContainerProvider extends ChangeNotifier {
  FriendsListTabContainerModel friendsListTabContainerModelObj =
      FriendsListTabContainerModel();

  @override
  void dispose() {
    super.dispose();
  }
}
