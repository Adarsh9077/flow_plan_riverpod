import 'package:flow_plan/common/helpers/db_helper.dart';
import 'package:flow_plan/common/widgets/app_style.dart';
import 'package:flow_plan/common/widgets/custom_text.dart';
import 'package:flow_plan/common/widgets/expansion_tile_custom.dart';
import 'package:flow_plan/common/widgets/height_spacer.dart';
import 'package:flow_plan/common/widgets/reusable_text.dart';
import 'package:flow_plan/common/widgets/width_spacer.dart';
import 'package:flow_plan/features/todo/controllers/expansion_provider.dart';
import 'package:flow_plan/features/todo/controllers/todo/todo_provider.dart';
import 'package:flow_plan/features/todo/pages/add.dart';
import 'package:flow_plan/features/todo/widgets/completed_tasks.dart';
import 'package:flow_plan/features/todo/widgets/day_after_tomorrow_tasks.dart';
import 'package:flow_plan/features/todo/widgets/todo_tile.dart';
import 'package:flow_plan/features/todo/widgets/tomorrow_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import '../../../common/models/task_modal.dart';
import '../../../common/utils/constants.dart';
import '../widgets/today_task.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    // loadData();
  }

  void loadData() async {
    final items = await DBHelper.getItems();
    print("FlowPlans@@@@@@@@@@");
    items.forEach((item) {
      print(item);
      print("object\n");
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(todoStateProvider.notifier).refresh();
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddTask()),
                          );
                        },
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
                        child: TodayTask(),
                      ),
                      Container(
                        color: AppConst.kBKLight,
                        height: AppConst.kHeight * 0.3,
                        child: CompletedTasks(),
                      ),
                    ],
                  ),
                ),
              ),
              HeightSpacer(height: 20),
              TomorrowList(),
              HeightSpacer(height: 20),
              DayAfterTomorrowTasks(),
              HeightSpacer(height: 20),
              ExpansionTileCustom(
                title: DateTime.now()
                    .add(Duration(days: 3))
                    .toString()
                    .substring(5, 10),
                onExpansionChanged: (bool extended) {
                  ref
                      .read(expansionState1Provider.notifier)
                      .setStart(!extended);
                },
                subTitle: "Day after tomorrow of the next day",
                trailing: Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: ref.watch(expansionState1Provider)
                      ? Icon(AntDesign.circledown, color: AppConst.kLight)
                      : Icon(
                          AntDesign.closecircleo,
                          color: AppConst.kBlueLight,
                        ),
                ),
                children: [
                  TodoTile(
                    start: "08:00",
                    end: "10:00",
                    switcher: Switch(
                      value: true,
                      onChanged: (value) {
                        setState(() {
                          value = !value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
