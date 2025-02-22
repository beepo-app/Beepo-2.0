import 'package:beepo/constants/constants.dart';
import 'package:beepo/screens/profile/account_type_screen.dart';
import 'package:beepo/screens/profile/edit_profile_screen.dart';
import 'package:beepo/screens/profile/user_profile_security_screen.dart';
import 'package:beepo/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../Utils/styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.h,
        centerTitle: true,
        backgroundColor: AppColors.secondaryColor,
        title: Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: AppText(
            text: "My Profile",
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
            color: AppColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 60.r,
                  backgroundImage: const AssetImage("assets/profile_img1.png"),
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text: "Yomna Elema",
                    color: const Color(0xffff9c34),
                    fontSize: 20.sp,
                  ),
                  SizedBox(width: 8.w),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const EditProfileScreen();
                      }));
                    },
                    child: const Icon(
                      Icons.mode_edit_outlined,
                      color: Color(0xffff9c34),
                      size: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Center(
                child: AppText(
                  text: "@username",
                  color: AppColors.secondaryColor,
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(height: 40.h),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const AccountTypeScreen();
                      },
                    ),
                  );
                },
                child: Row(
                  children: [
                    Expanded(
                      child: AppText(
                        text: "Account Type",
                        fontSize: 14.sp,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    AppText(
                      text: "Standard",
                      fontSize: 11.sp,
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: AppText(
                        text: "Theme",
                        fontSize: 14.sp,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                  AppText(
                    text: "System Default",
                    fontSize: 11.sp,
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const UserProfileSecurityScreen();
                      },
                    ),
                  );
                },
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: AppText(
                          text: "Security",
                          fontSize: 14.sp,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: Color(0x660e014c),
                      size: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: AppText(
                        text: "Help",
                        fontSize: 14.sp,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: Color(0x660e014c),
                    size: 20,
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: AppText(
                        text: "Notification",
                        fontSize: 14.sp,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: Color(0x660e014c),
                    size: 20,
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              InkWell(
                onTap: () {
                  print('https://www.beepoapp.net');
                },
                child: Row(
                  children: [
                    Expanded(
                      child: AppText(
                        text: "About",
                        fontSize: 14.sp,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: Color(0x660e014c),
                      size: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Expanded(
                    child: AppText(
                      text: "Invite Friends",
                      fontSize: 14.sp,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: Color(0x660e014c),
                    size: 20,
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
