import 'package:flow_plan/common/widgets/titles.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ExpansionTileCustom extends StatelessWidget {
  const ExpansionTileCustom({
    super.key,
    required this.title,
    required this.subTitle,
    this.onExpansionChanged,
    this.trailing,
    required this.children,
  });

  final String title;
  final String subTitle;
  final void Function(bool)? onExpansionChanged;
  final Widget? trailing;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppConst.kBKLight,
        borderRadius: BorderRadius.circular(AppConst.kRadius),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: BottomTitles(title: title, subTitle: subTitle),
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.zero,
          onExpansionChanged: onExpansionChanged,
          trailing: trailing,
          children: children,
        ),
      ),
    );
  }
} // 3:46:00
