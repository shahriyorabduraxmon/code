import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tasker/app_color.dart';
import 'package:tasker/app_route/app_route_name.dart';
import 'package:tasker/app_text_style.dart';
import 'package:tasker/emoji_single.dart';

import 'create_alert_bottom.dart';
import 'share_alert_bottom.dart';

class SendAlertBottom extends StatelessWidget {
  const SendAlertBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: FloatingActionButton(
            onPressed: () {
              Get.back();
            },
            backgroundColor: AppColor.white,
            child: Icon(
              Icons.arrow_back_rounded,
              color: AppColor.c15213B,
            ),
          ),
        ),
        12.verticalSpace,
        Container(
          // width: double.maxFinite,
          // height: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
            ),
          ),
          padding: EdgeInsets.only(top: 8.h),
          //  height: 626.h,
          child: Column(
            children: <Widget>[
              Container(
                height: 5.h,
                width: 64.w,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(30)),
              ),
              12.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 60.w,
                  ),
                  Text(
                    "Send Alert",
                    style: AppTextStyle.boldNormal.copyWith(fontSize: 18.sp),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(AppRouteName.editAlert);
                    },
                    child: Text(
                      "Edit",
                      style: AppTextStyle.boldNormal
                          .copyWith(fontSize: 16.sp, color: Colors.red),
                    ),
                  ),
                ],
              ),
              4.verticalSpace,
              Text(
                "Please, choose an emoji and type in an alert name",
                style: AppTextStyle.regularNormal
                    .copyWith(fontSize: 12.sp, color: AppColor.c62677D),
              ),
              32.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                height: 346.h,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 140,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 12),
                  itemBuilder: (BuildContext ctx, index) {
                    return EmojiSIngle(
                      emoji: '😍',
                      emojiName: 'Love',
                    );
                  },
                  itemCount: 12,
                ),
              ),
              24.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: AppColor.gradient_03,
                      borderRadius: BorderRadius.circular(12.r)),
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return ShareAlertBottom();
                          });
                    }, //AppColor.gradient_03
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        8.horizontalSpace,
                        Text(
                          'Continue',
                          style: AppTextStyle.boldNormal
                              .copyWith(color: Colors.white, fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              12.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: ElevatedButton(
                    onPressed: () {
                      // sendAlert(context);
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return CreateAlertBottom();
                          });
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add Custom Alert',
                          style: AppTextStyle.boldNormal.copyWith(
                              color: AppColor.c41A3F0, fontSize: 16.sp),
                        ),
                      ],
                    )),
              ),
              12.verticalSpace,
            ],
          ),
        ),
      ],
    );
  }
}