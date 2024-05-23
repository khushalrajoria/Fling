import 'package:flutter/material.dart';
import '../models/requests_list_model.dart';

/// A provider class for the RequestsListPage.
///
/// This provider manages the state of the RequestsListPage, including the
/// current requestsListModelObj
// ignore_for_file: must_be_immutable
class RequestsListProvider extends ChangeNotifier {

  // RequestsListItem RequestsListItemObj = RequestsListItem();

  List<RequestsListItem> requestsList = [
    RequestsListItem(name: 'johan', hasCircle: true),
    RequestsListItem(name: 'timothee_mathew', hasCircle: true),
    RequestsListItem(name: 'amanriya', hasCircle: true),
    RequestsListItem(name: 'tanisha', hasCircle: true),
    RequestsListItem(name: 'shravya', hasCircle: true),
    RequestsListItem(name: 'shravya', hasCircle: true),
  ];
  @override
  void dispose() {
    super.dispose();
  }
}
