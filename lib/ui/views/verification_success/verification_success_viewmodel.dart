import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../helpers/constants/routes.dart';

class VerificationSuccessViewModel extends BaseViewModel {
  void goToVerificationSuccess() {
    locator<GoRouter>().push(AppRoutes.verificationSuccessView);
  }
}
