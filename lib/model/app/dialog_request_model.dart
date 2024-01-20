
import 'package:flutter/foundation.dart';

class DialogRequestModel<T> {
  final String? title;
  final String? description;
  final bool? hasImage;
  final String? imageUrl;
  final String? mainButtonTitle;
  final bool? showIconInMainButton;
  final String? secondaryButtonTitle;
  final bool? showIconInSecondaryButton;
  final String? additionalButtonTitle;
  final bool? showIconInAdditionalButton;
  final bool? takesInput;
  final dynamic variant;
  final bool? hasSecondaryButton;
  final VoidCallback? onTap;
  final T? data;

  DialogRequestModel(
      {this.onTap,
        this.showIconInMainButton,
        this.showIconInSecondaryButton,
        this.showIconInAdditionalButton,
        this.title,
        this.description,
        this.hasImage,
        this.imageUrl,
        this.mainButtonTitle,
        this.secondaryButtonTitle,
        this.additionalButtonTitle,
        this.takesInput,
        this.data,
        this.variant,
        this.hasSecondaryButton = false});
}