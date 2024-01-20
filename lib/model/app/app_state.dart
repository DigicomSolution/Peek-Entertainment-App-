class AppState {
  bool isLogged;
  bool isOnboarded;
  bool isInit;

  AppState({
    this.isInit = false,
    this.isLogged = false,
    this.isOnboarded = false,
  });
}
