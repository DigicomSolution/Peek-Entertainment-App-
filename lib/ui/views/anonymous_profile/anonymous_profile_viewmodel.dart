import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peek/app/locator.dart';
import 'package:peek/helpers/constants/routes.dart';
import 'package:peek/repository/user_repo.dart';
import 'package:stacked/stacked.dart';

import '../../../repository/auth_repo.dart';

class AnonymousProfileViewModel extends BaseViewModel {
  final userNameController = TextEditingController();
  XFile? _image;
  XFile? get image => _image;
  final formKey = GlobalKey<FormState>();
  String? _errorText;
  String? get errorText => _errorText;
  Future<void> pickImage() async {
    final picker = ImagePicker();
    _image = await picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  Future<void> removeImage() async {
    _image = null;
    notifyListeners();
  }

  Future<void> saveProfileDetails() async {
    if (formKey.currentState!.validate()) {
      setBusy(true);
      final data = FormData.fromMap({
        "userName": userNameController.text,
        "imageUrl": await MultipartFile.fromFile(
          "${image?.path}",
          filename: "${image?.name}",
        ),
      });
      final result = await UserRepo.createUserProfile(userModel: data);
      if (result.statusCode == 201) {
        setBusy(false);
        locator<GoRouter>().go(AppRoutes.verifyIdentityView);
      }
      if (result.statusCode == 400) {
        if (result.message!
            .toLowerCase()
            .contains("Username is already taken".toLowerCase())) {
          _errorText = "Username not available";
          notifyListeners();
        }
      }
      setBusy(false);
      notifyListeners();
    }
  }
}
