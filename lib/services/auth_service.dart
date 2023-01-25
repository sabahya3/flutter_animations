import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';


class AuthService {
  static AuthService instance = AuthService();

  loginWithFacebook() async {
    LoginResult facebookResult = await FacebookAuth.i.login(
      permissions: ['email', 'public_profile'],
    );

    if (facebookResult.status == LoginStatus.success) {
      final userData = await FacebookAuth.i.getUserData(fields: "name,email,picture");

      print(userData);
    }
  }
}
