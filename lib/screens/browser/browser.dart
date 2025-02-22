import 'package:beepo/components/browser_container.dart';
import 'package:beepo/constants/constants.dart';
import 'package:beepo/widgets/beepo_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Utils/styles.dart';

class Browser extends StatefulWidget {
  const Browser({Key? key}) : super(key: key);

  @override
  State<Browser> createState() => _BrowserState();
}

class _BrowserState extends State<Browser> {
  bool comingSoon = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.h,
        centerTitle: true,
        backgroundColor: AppColors.secondaryColor,
        title: Padding(
          padding: EdgeInsets.only(top: 15.h, right: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "DAPP Browser",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/Celo.png',
                    height: 13,
                    width: 13,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Celo Network",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.white,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.white,
                    size: 14.sp,
                  ),
                ],
              ),
            ],
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
        ),
      ),
      body:
          // comingSoon
          //     ? Padding(
          //         padding: const EdgeInsets.all(20),
          //         child: Center(
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               LottieBuilder.asset(
          //                 'assets/lottie/coming_soon.json',
          //                 height: 300,
          //                 width: 300,
          //               ),
          //               Text(
          //                 "Hey Beeper, Stay tuned we,re still cooking this awesome feature",
          //                 textAlign: TextAlign.center,
          //                 style:
          //                     TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //               ),
          //             ],
          //           ),
          //         ),
          //       )
          Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            BeepoTextField(
              filled: false,
              prefixIcon: Icon(
                Icons.search,
                size: 20.sp,
                color: AppColors.dividerGrey,
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: GridView.builder(
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, index) {
                  return BrowserContainer(
                    image: 'assets/mobius.png',
                    title: 'mobius',
                  );
                },
              ),
            ),
            SizedBox(height: 15.h),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "NEWS",
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  separatorBuilder: (ctx, i) => SizedBox(height: 20),
                  itemBuilder: (ctx, i) {
                    return Container(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      width: double.infinity,
                      height: 70.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: secondaryColor,
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/news.png',
                              height: 87,
                              width: 104,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 15.w),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Here's Why Blockchain is the Technology For The Future Here's Why Blockchain is the Technology For The Future",
                                  maxLines: 3,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.white,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 27),
                                Text(
                                  "technology.com",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
