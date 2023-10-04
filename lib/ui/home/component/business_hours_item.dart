import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:profil_resto/styles/custom_color.dart';
import 'package:profil_resto/styles/custom_text_style.dart';
import 'package:profil_resto/ui/model/business_hours_model.dart';


class BusinessHoursItem extends StatelessWidget {
  final BusinessHoursModel data;
  
  const BusinessHoursItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(bottom: 5.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: CustomColor.primary500
      ),
      child: Row(
        children: [
          FaIcon(FontAwesomeIcons.solidClock,size: 12.r,color: CustomColor.white,),
          SizedBox(width: 10.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.day,style: CustomTextStyle.reguler12.copyWith(color: CustomColor.white),),
              SizedBox(height: 2.h,),
              Row(
                children: [
                  Text("${data.openingHour} - ${data.closingHour}",style: CustomTextStyle.reguler10.copyWith(color: CustomColor.white),)
                ],
              )

            ],
          )
        ],
      ),
    );
  }
}
