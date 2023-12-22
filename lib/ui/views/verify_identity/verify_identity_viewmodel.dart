import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../helpers/constants/routes.dart';

class VerifyIdentityViewModel extends BaseViewModel implements Initialisable {
  late CameraController controller;
  late Future<void> initializeControllerFuture;

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    initializeControllerFuture = controller.initialize();
  }

  Future<XFile?> takePicture() async {
    try {
      await initializeControllerFuture;

      final XFile? image = await controller.takePicture();

      return image;
    } catch (e) {
      print(e);
      return null;
    }
  }

  void showPreview(XFile? imageFile, BuildContext context) {
    if (imageFile == null) {
      // Handle error or null image file
      return;
    }

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            Image.file(File(imageFile.path)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                    // Optionally, handle retake logic here
                  },
                ),
                IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    Navigator.pop(context);
                    goToIdentityVerificationSuccess();
                    // Proceed with the captured image
                    // You can send this image for processing or validation
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Future<void> initialise() async {
    await _initializeCamera();
  }

  void goToIdentityVerificationSuccess() {
    locator<GoRouter>().push(AppRoutes.verifyIdentitySuccessView);
  }
}
