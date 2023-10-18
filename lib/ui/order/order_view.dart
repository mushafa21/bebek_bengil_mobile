import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profil_resto/model/menu_model.dart';
import 'package:profil_resto/utils/extensions.dart';
import 'package:profil_resto/widget/button_primary.dart';

import '../../styles/custom_text_style.dart';


class OrderPage extends StatelessWidget {
  final MenuModel menu;
  final int jumlahPesan;
  const OrderPage({super.key, required this.menu, required this.jumlahPesan});

  @override
  Widget build(BuildContext context) {
    AppBar appBar(){
      return AppBar(
        elevation: 0,
        title: Text("Pesanan",style: CustomTextStyle.bold18,),
      );
    }
    
    Widget textPesan(){
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Pemesanan ${menu.name} (${menu.price.convertRupiah()} x ${jumlahPesan}) Berhasil disimpan",style: CustomTextStyle.semiBold14,textAlign: TextAlign.center,),
            Text("Total Bayar : ${(menu.price * jumlahPesan).convertRupiah()}",style: CustomTextStyle.bold20,)
          ],
        ),
      );
    }

    Widget mainView(){
      return Padding(
        padding:  EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textPesan(),
            SizedBox(height: 40.h,),
            ButtonPrimary(click: (){
              Navigator.pop(context);
        }, teks: "Kembali Ke Menu")
          ],
        ),
      );
    }

    return Scaffold(
      appBar: appBar(),
      body: mainView(),
      

    );
  }
}
