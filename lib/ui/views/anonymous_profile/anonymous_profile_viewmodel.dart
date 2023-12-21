import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peek/app/locator.dart';
import 'package:peek/helpers/constants/routes.dart';
import 'package:stacked/stacked.dart';

class AnonymousProfileViewModel extends BaseViewModel {
  final userNameController = TextEditingController();
  XFile? _image;
  XFile? get image => _image;
  Future<void> pickImage() async {
    final picker = ImagePicker();
    _image = await picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  Future<void> removeImage() async {
    _image = null;
    notifyListeners();
  }

  void goToVerifyView() {
    locator<GoRouter>().push(AppRoutes.verifyIdentityView);
  }
}
