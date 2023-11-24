import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../screen/home_screen.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final storage = new FlutterSecureStorage();

  Future<void> verifyPhoneNumber(
      String phoneNumber, BuildContext context, Function setData) async {
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      showsnacBar(context, "Verifcation Completed");
    };
    PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException exception) {
      showsnacBar(context, exception.toString());
    };

    PhoneCodeSent codeSent = (String verificationId, [forceResendingToken]) {
      showsnacBar(context, "Verifcation code sent on the phone number");
      setData(verificationId);
    };
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      showsnacBar(context, "Time out");
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      showsnacBar(context, e.toString());
    }
  }

  void storeTokenAndData(UserCredential userCredential) async {
    print("storing token and data");
    await storage.write(
        key: "token", value: userCredential.credential!.token.toString());
    await storage.write(
        key: "usercredential", value: userCredential.toString());
  }

  Future<void> signInwithPhoneNumber(
      String verificationId, String smsCode, BuildContext context) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      storeTokenAndData(userCredential);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
        builder: (context) {
          return HomeScreen();
        },
      ), (route) => false);
      showsnacBar(context, "logged In");
    } catch (e) {
      showsnacBar(context, e.toString());
    }
  }

  void showsnacBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
