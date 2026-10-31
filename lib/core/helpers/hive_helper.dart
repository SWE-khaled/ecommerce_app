import 'package:hive_flutter/adapters.dart';

class HiveHelper {
  static const tokenBox = "tokenBox";

 // Stores the authentication token in Hive.
  static void setToken(String token) async {
    await Hive.box(tokenBox).put(tokenBox, token);
  }

 // Checks whether a token exists in Hive.
  static bool getToken() {
    if (Hive.box(tokenBox).isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
  /*
  
  static void saveOnboardingEntry() async {
    await Hive.box(onBoardingBox).put(onBoardingBox, true);
  }

  static bool isOnboardingSeen() {
    if (Hive.box(onBoardingBox).get(onBoardingBox) != null) {
      return true;
    } else {
      return false;
    }
  */
}
