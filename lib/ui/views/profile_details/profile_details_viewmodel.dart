import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:peek/repository/user_repo.dart';
import 'package:stacked/stacked.dart';

import '../../../model/response_model/user_personal_details_model.dart';

class ProfileDetailsViewModel extends BaseViewModel implements Initialisable {
  XFile? _image;
  XFile? get image => _image;
  String? _errorText;
  String? get errorText => _errorText;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  UserPersonalDetailsModel? _userPersonalDetailsModel;
  UserPersonalDetailsModel? get userPersonalDetailsModel =>
      _userPersonalDetailsModel;
  Future<void> pickImage() async {
    final picker = ImagePicker();
    _image = await picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
  }

  Future<void> removeImage() async {
    _image = null;
    notifyListeners();
    await pickImage();
  }

  Future<void> getPersonalDetails() async {
    setBusy(true);
    final result = await UserRepo.getUserPersonalDetails();
    if (result.statusCode == 200) {
      _userPersonalDetailsModel =
          UserPersonalDetailsModel.fromJson(result.data);
    }
    setBusy(false);
  }

  @override
  Future<void> initialise() async {
    await getPersonalDetails();
    if (userPersonalDetailsModel != null) {
      firstNameController.text = "${userPersonalDetailsModel!.firstName}";
      lastNameController.text = "${userPersonalDetailsModel!.lastName}";
      emailController.text = "${userPersonalDetailsModel!.email}";
    }
  }
}
