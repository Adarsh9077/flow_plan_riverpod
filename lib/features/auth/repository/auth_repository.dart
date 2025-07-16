import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow_plan/common/routes/routes.dart';
import 'package:flow_plan/common/widgets/show_dialogue.dart';
import 'package:flutter/material.dart';

class AuthRepository {
  final FirebaseAuth auth;

  AuthRepository({required this.auth});

  void verifyOtp({
    required BuildContext context,
    required String smsCodeId,
    required String smsCode,
    required bool mounted,
  }) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: smsCodeId,
        smsCode: smsCode,
      );
      await auth.signInWithCredential(credential);
      if (!mounted) {
        return;
      }
      Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
    } on FirebaseAuth catch (e) {
      // print(e);
      showAlertDialog(context: context, message: e.toString());
    }
  }
} // 09:02:00
