import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/friends_item_model.dart';
import '../models/friends_list_model.dart';

/// A provider class for the FriendsListPage.
///
/// This provider manages the state of the FriendsListPage, including the
/// current friendsListModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class FriendsListProvider extends ChangeNotifier {
  FriendsListModel friendsListModelObj = FriendsListModel();

  @override
  void dispose() {
    super.dispose();
  }
}
