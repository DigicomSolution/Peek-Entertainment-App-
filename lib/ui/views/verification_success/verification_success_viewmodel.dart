import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../helpers/constants/routes.dart';

class VerificationSuccessViewModel extends BaseViewModel {
  void goToProfileSetup() {
    locator<GoRouter>().push(AppRoutes.anonymousProfileView);
  }
}
