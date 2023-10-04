import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profil_resto/styles/custom_color.dart';
import 'package:profil_resto/styles/custom_text_style.dart';
import 'package:profil_resto/ui/model/menu_model.dart';
import 'package:profil_resto/widget/image_view.dart';


class MenuItem extends StatelessWidget {
  final MenuModel data;
  const MenuItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w,vertical: 4.w),
      child: Column(
        children: [
          AspectRatio(
              aspectRatio: 1,
              child: ImageView(url: data.image,fit: BoxFit.cover,)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r)),
              border: Border.all(color: CustomColor.gray100,width: 1.w)
            ),
            padding: EdgeInsets.all(10.w),
            child: Column(
              children: [
                Text(data.name,style: CustomTextStyle.semiBold14.copyWith(color: CustomColor.primary500),),
                SizedBox(height: 6.h,),
                Text(data.desc,style: CustomTextStyle.reguler10),

              ],
            ),
          )


        ],
      ),

    );
  }
}
