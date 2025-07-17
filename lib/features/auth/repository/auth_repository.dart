import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow_plan/common/helpers/db_helper.dart';
import 'package:flow_plan/common/routes/routes.dart';
import 'package:flow_plan/common/widgets/show_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

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

  void sendOtp({
    required BuildContext context,
    required String phoneNumber,
  }) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          showAlertDialog(context: context, message: e.toString());
        },
        codeSent: (smsCodeId, resendCodeId) {
          DBHelper.createUser(1);
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.otp,
            (route) => false,
            arguments: {'phone': phoneNumber, 'smsCodeId': smsCodeId},
          );
        },
        codeAutoRetrievalTimeout: (String smsCodeId) {},
      );
    } on FirebaseAuth catch (e) {
      showAlertDialog(context: context, message: e.toString());
    }
  }
} // 09:12:35
