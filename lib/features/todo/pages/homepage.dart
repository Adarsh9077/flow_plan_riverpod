import 'package:flow_plan/common/widgets/app_style.dart';
import 'package:flow_plan/common/widgets/custom_text.dart';
import 'package:flow_plan/common/widgets/expansion_tile_custom.dart';
import 'package:flow_plan/common/widgets/height_spacer.dart';
import 'package:flow_plan/common/widgets/reusable_text.dart';
import 'package:flow_plan/common/widgets/width_spacer.dart';
import 'package:flow_plan/features/todo/widgets/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/utils/constants.dart';

// class Test extends
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late final TabController tabController = TabController(
    length: 2,
    vsync: this,
  );
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(85),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ReusableText(
                      text: "Dashboard",
                      style: appStyle(18, AppConst.kLight, FontWeight.bold),
                    ),
                    Container(
                      width: 25.w,
                      height: 25.w,
                      decoration: BoxDecoration(
                        color: AppConst.kLight,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.add, color: AppConst.kBKDark),
                      ),
                    ),
                  ],
                ),
              ),
              HeightSpacer(height: 20.w),
              CustomTextField(
                controller: searchController,
                hintText: "Search",
                prefixIcon: Container(
                  padding: EdgeInsets.all(14.h),
                  child: GestureDetector(
                    onTap: null,
                    child: Icon(AntDesign.search1, color: AppConst.kGreyLight),
                  ),
                ),
                suffixIcon: Icon(
                  FontAwesome.sliders,
                  color: AppConst.kGreyLight,
                ),
              ),
              HeightSpacer(height: 15.h),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView(
            children: [
              HeightSpacer(height: 25.h),
              Row(
                children: [
                  Icon(FontAwesome.tasks, size: 20, color: AppConst.kLight),
                  WidthSpacer(width: 10),
                  ReusableText(
                    text: "Today's Task",
                    style: appStyle(18, AppConst.kLight, FontWeight.bold),
                  ),
                ],
              ),
              HeightSpacer(height: 25.h),
              Container(
                decoration: BoxDecoration(
                  color: AppConst.kLight,
                  borderRadius: BorderRadius.circular(AppConst.kRadius),
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    color: AppConst.kGreyLight,
                    borderRadius: BorderRadius.circular(
                      AppConst.kRadius * 0.75,
                    ),
                  ),
                  labelPadding: EdgeInsets.zero,
                  isScrollable: false,
                  labelColor: AppConst.kBlueLight,
                  labelStyle: appStyle(
                    24,
                    AppConst.kBlueLight,
                    FontWeight.w700,
                  ),
                  controller: tabController,
                  unselectedLabelColor: AppConst.kLight,
                  tabs: [
                    Tab(
                      child: SizedBox(
                        width: AppConst.kWidth * 0.5,
                        child: Center(
                          child: ReusableText(
                            text: "Pending",
                            style: appStyle(
                              16,
                              AppConst.kBKDark,
                              FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        width: AppConst.kWidth * 0.5,
                        child: Center(
                          child: ReusableText(
                            text: "Completed",
                            style: appStyle(
                              16,
                              AppConst.kBKDark,
                              FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              HeightSpacer(height: 20),
              SizedBox(
                height: AppConst.kHeight * 0.3,
                width: AppConst.kWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppConst.kRadius),
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Container(
                        color: AppConst.kBKLight,
                        height: AppConst.kHeight * 0.3,
                        child: ListView(
                          children: [TodoTile(start: "03:00", end: "5:00")],
                        ),
                      ),
                      Container(
                        color: AppConst.kGreyLight,
                        height: AppConst.kHeight * 0.3,
                      ),
                    ],
                  ),
                ),
              ),
              HeightSpacer(height: 20),
              ExpansionTileCustom(
                title: "Tomorrow's Task",
                subTitle: "Tomorrow's Task are shawn here",
                children: [],
              ),
              HeightSpacer(height: 20),
              ExpansionTileCustom(
                title: DateTime.now()
                    .add(Duration(days: 2))
                    .toString()
                    .substring(5, 10),
                subTitle: "Day after tomorrow tasks",
                children: [],
              ),
              HeightSpacer(height: 20),
              ExpansionTileCustom(
                title: DateTime.now()
                    .add(Duration(days: 3))
                    .toString()
                    .substring(5, 10),
                subTitle: "Day after tomorrow tasks",
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
} // 4:16:00
