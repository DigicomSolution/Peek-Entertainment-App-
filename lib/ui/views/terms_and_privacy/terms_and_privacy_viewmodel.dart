import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../helpers/constants/routes.dart';

class TermsAndPrivacyViewModel extends BaseViewModel {
  void goToSignUpView() {
    locator<GoRouter>().push(AppRoutes.signupView);
  }
}
