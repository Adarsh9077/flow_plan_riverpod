import 'package:country_picker/country_picker.dart';
import 'package:flow_plan/common/utils/constants.dart';
import 'package:flow_plan/common/widgets/app_style.dart';
import 'package:flow_plan/common/widgets/custom_otl_btn.dart';
import 'package:flow_plan/common/widgets/height_spacer.dart';
import 'package:flow_plan/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../common/widgets/custom_text.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController phoneController = TextEditingController();
  Country country = Country(
    phoneCode: "91",
    countryCode: "IND",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "INDIA",
    example: "INDIA",
    displayName: "India",
    displayNameNoCountryCode: "IND",
    e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: ListView(
            children: [
              HeightSpacer(height: 120),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset("assets/images/todo.png", width: 300),
              ),
              HeightSpacer(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16.w),
                child: ReusableText(
                  text: "Please enter your phone number",
                  style: appStyle(17, AppConst.kLight, FontWeight.w500),
                ),
              ),
              HeightSpacer(height: 20),
              CustomTextField(
                controller: phoneController,
                prefixIcon: Container(
                  padding: EdgeInsets.all(12),
                  child: GestureDetector(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        countryListTheme: CountryListThemeData(
                          backgroundColor: AppConst.kLight,
                          bottomSheetHeight: AppConst.kHeight * 0.6,
                          textStyle: appStyle(
                            12,
                            AppConst.kBKDark,
                            FontWeight.normal,
                          ),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(AppConst.kRadius),
                            topLeft: Radius.circular(AppConst.kRadius*1.5),
                          ),
                        ),
                        onSelect: (code) {
                          setState(() {});
                        },
                      );
                    },
                    child: ReusableText(
                      text: "${country.flagEmoji} ${country.countryCode}",
                      style: appStyle(18, AppConst.kBKDark, FontWeight.bold),
                    ),
                  ),
                ),
                keyboardType: TextInputType.number,
                hintText: "Enter Phone Number",
                hintStyle: appStyle(16, AppConst.kBKDark, FontWeight.w600),
              ),
              HeightSpacer(height: 20),
              CustomOutlineBtn(
                width: AppConst.kWidth * 0.9,
                height: AppConst.kHeight * 0.07,
                color: AppConst.kBKDark,
                text: "Send Code",
                color2: AppConst.kLight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 2:11:00
