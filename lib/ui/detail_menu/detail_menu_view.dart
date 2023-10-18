import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profil_resto/model/menu_model.dart';
import 'package:profil_resto/styles/custom_color.dart';
import 'package:profil_resto/styles/custom_text_style.dart';
import 'package:profil_resto/ui/order/order_view.dart';
import 'package:profil_resto/utils/extensions.dart';
import 'package:profil_resto/widget/button_primary.dart';
import 'package:profil_resto/widget/image_view.dart';

class DetailMenuPage extends StatefulWidget {
  final MenuModel menu;
  const DetailMenuPage({super.key, required this.menu});

  @override
  State<DetailMenuPage> createState() => _DetailMenuPageState();
}

class _DetailMenuPageState extends State<DetailMenuPage> {
  int jumlah = 1;
  @override
  Widget build(BuildContext context) {
    AppBar appBar(){
      return AppBar(
        elevation: 0,
        title: Text("Detail Menu",style: CustomTextStyle.bold18,),
      );
    }

    Widget imageMenu(){
      return ImageView(url: widget.menu.image,width: double.infinity,fit: BoxFit.cover,);
    }

    Widget detailView(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.menu.name,style: CustomTextStyle.bold18,),
          SizedBox(height: 10.h,),
          Text(widget.menu.desc,style: CustomTextStyle.reguler12,),

        ],
      );
    }
    
    Widget priceView(){
      return Row(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: CustomColor.gray200)
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: (){
                    if(jumlah > 1){
                      jumlah--;
                      setState(() {

                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(5.r),
                    child: Center(child: Text("-",style: CustomTextStyle.reguler18.copyWith(color: Colors.white),)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),bottomLeft: Radius.circular(10.r)),
                        color: CustomColor.primary500
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5.r,horizontal: 20.w),
                  child: Center(child: Text("$jumlah",style: CustomTextStyle.reguler14,)),
                ),
                InkWell(
                  onTap: (){
                    jumlah++;
                    setState(() {

                    });

                  },
                  child: Container(
                    padding: EdgeInsets.all(5.r),
                    child: Center(child: Text("+",style: CustomTextStyle.reguler18.copyWith(color: Colors.white),)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10.r),bottomRight: Radius.circular(10.r)),
                        color: CustomColor.primary500
                    ),
                  ),
                ),


              ],
            ),
          ),
          Spacer(),
          Text(widget.menu.price.convertRupiah(),style: CustomTextStyle.bold14.copyWith(color: CustomColor.primary500),)
        ],
      );
    }


    Widget footer(){
      return Column(
        children: [
          Container(
            width: double.infinity,
            height: 1.h,
            color: CustomColor.gray200,
          ),
          Container(

            padding: EdgeInsets.all(16.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("$jumlah Item",style: CustomTextStyle.reguler10,),
                      Text((jumlah * widget.menu.price).convertRupiah(),style: CustomTextStyle.bold18.copyWith(color: CustomColor.primary500),)
                    ],
                  ),
                ),
                ButtonPrimary(click: (){
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OrderPage(menu: widget.menu, jumlahPesan: jumlah)));
                }, teks: "Pesan",width: 0,height: 0,)
              ],

            ),
          ),
        ],
      );
    }

    Widget mainView(){
      return Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  imageMenu(),
                  Padding(padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      priceView(),
                      SizedBox(height: 20.h,),
                      detailView()
                    ],
                  ),)

                ],
              ),
            ),
          ),
          footer(),
        ],
      );
    }
    return Scaffold(
      appBar: appBar(),
      body: mainView(),

    );
  }
}
