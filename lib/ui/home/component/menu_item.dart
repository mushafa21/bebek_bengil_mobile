import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profil_resto/styles/custom_color.dart';
import 'package:profil_resto/styles/custom_text_style.dart';
import 'package:profil_resto/ui/detail_menu/detail_menu_view.dart';
import 'package:profil_resto/utils/extensions.dart';
import 'package:profil_resto/widget/button_primary.dart';
import 'package:profil_resto/widget/image_view.dart';

import '../../../model/menu_model.dart';


class MenuItem extends StatelessWidget {
  final MenuModel data;
  const MenuItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: CustomColor.gray100,width: 1.w)
      ),
      margin: EdgeInsets.symmetric(horizontal: 4.w,vertical: 4.w),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: ImageView(url: data.image,fit: BoxFit.cover,width: 100.r,height: 100.r,)),
          Expanded(
            child: Container(

              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.name,style: CustomTextStyle.semiBold14.copyWith(color: CustomColor.primary500),),
                  SizedBox(height: 6.h,),
                  Text(data.desc,style: CustomTextStyle.reguler10,maxLines: 2,overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 16.h,),
                  Row(
                    children: [
                      Text(data.price.convertRupiah(),style: CustomTextStyle.semiBold10.copyWith(color: CustomColor.primary500),),
                      Spacer(),
                      ButtonPrimary(click: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailMenuPage(menu: data)));
                      }, teks: "Pesan",width: 0,height: 0,)
                    ],
                  )

                ],
              ),
            ),
          )


        ],
      ),

    );
  }
}
