import 'package:flow_plan/common/utils/constants.dart';
import 'package:flow_plan/common/widgets/app_style.dart';
import 'package:flow_plan/common/widgets/reusable_text.dart';
import 'package:flow_plan/features/auth/controllers/code_provider.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TestPage extends ConsumerWidget {
  // const TestPage;
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String code = ref.watch(codeStateProvider);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ReusableText(
              text: code,
              style: appStyle(28, AppConst.kLight, FontWeight.w800),
            ),
            TextButton(
              onPressed: () {
                ref.read(codeStateProvider.notifier).setStart("Hellooooo....");
              },
              child: Text("Fuck Me...."),
            ),
          ],
        ),
      ),
    );
  }
}

// 04:59:00
