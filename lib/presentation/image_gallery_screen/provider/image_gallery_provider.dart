import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/image_gallery_model.dart';

/// A provider class for the ImageGalleryScreen.
///
/// This provider manages the state of the ImageGalleryScreen, including the
/// current imageGalleryModelObj
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class ImageGalleryProvider extends ChangeNotifier {
  ImageGalleryModel imageGalleryModelObj = ImageGalleryModel();

  @override
  void dispose() {
    super.dispose();
  }
}
