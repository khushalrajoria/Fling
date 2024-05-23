import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/my_image_gallery_model.dart';

/// A provider class for the MyImageGalleryScreen.
///
/// This provider manages the state of the MyImageGalleryScreen, including the
/// current myImageGalleryModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class MyImageGalleryProvider extends ChangeNotifier {
  MyImageGalleryModel myImageGalleryModelObj = MyImageGalleryModel();

  @override
  void dispose() {
    super.dispose();
  }
}
