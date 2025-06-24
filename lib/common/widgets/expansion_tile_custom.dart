import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ExpansionTileCustom extends StatelessWidget {
  const ExpansionTileCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppConst.kBKLight,
        borderRadius: BorderRadius.circular(AppConst.kRadius),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(title: Placeholder()),
      ),
    );
  }
}
