import 'package:go_router/go_router.dart';
import 'package:peek/app/locator.dart';
import 'package:peek/helpers/constants/routes.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  void goToTermsView() {
    locator<GoRouter>().push(AppRoutes.termsAndPrivacyView);
  }
}
