import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../helpers/constants/routes.dart';
import '../../../services/app_services/app_state_service.dart';

class TermsAndPrivacyViewModel extends BaseViewModel {
  void goToSignUpView() {
    locator<AppStateService>().initialized = true;
    locator<GoRouter>().push(AppRoutes.signupView);
  }
}
