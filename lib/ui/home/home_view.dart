
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mailto/mailto.dart';
import 'package:profil_resto/styles/custom_color.dart';
import 'package:profil_resto/styles/custom_text_style.dart';
import 'package:profil_resto/ui/detail_menu/detail_menu_view.dart';
import 'package:profil_resto/ui/home/component/business_hours_item.dart';
import 'package:profil_resto/ui/home/component/menu_item.dart';
import 'package:profil_resto/ui/home/component/slider.dart';
import 'package:profil_resto/widget/custom_grid_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/business_hours_model.dart';
import '../../model/menu_model.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});



  @override
  Widget build(BuildContext context) {

    final List<String> imageList = [
      "https://bebekbengil.co.id/assets/front/images/bebek-bengil-restaurant-nusa-dua-bali-at-bebek-bengil-v3n.jpeg",
      "https://bebekbengil.co.id/assets/front/images/bebek-bengil-restaurant-nusa-dua-bali-at-bebek-bengil-N6p.jpeg",
      "https://bebekbengil.co.id/assets/front/images/bebek-bengil-restaurant-nusa-dua-bali-at-bebek-bengil-MGR.jpeg",
    ];


    final List<MenuModel> menuList = [
      MenuModel(name: "Balinese Smoked Duck", desc: "Bebek Utuh Diasap Secara Tradisional Dengan Bumbu Dibalut Daun Kacang Beatle. Makanan Ini Disajikan Dengan Sate Bali, Sayuran, Nasi Kukus Dan Disertai Jus Buah Campur. (Makanan Ini Untuk 2 Orang)", image: "https://bebekbengil.co.id/assets/front/images/balinese-smoked-duck-at-bebek-bengil-gmW.jpeg",price: 25000),
      MenuModel(name: "Indonesian Rijstafel", desc: "Makanan Tradisional Indonesia Beras Saffron, Sate Bali, Kari Telur, Kari Ayam Bali, Ayam Jahe, Bebek Goreng Renyah, Sayuran Bali (Lawar) Dan Semua Hiasan Dengan Campuran Jus Buah, Pie Krim Kelapa Dan Buah Bali Tropis", image: "https://bebekbengil.co.id/assets/front/images/indonesian-rijstafel-at-bebek-bengil-61u.jpeg",price: 13500),
      MenuModel(name: "Bakso Bebek Bengil", desc: "Bakso daging bebek, sayuran hijau dan sambal", image: "https://bebekbengil.co.id/assets/front/images/bakso-bebek-bengil-at-bebek-bengil-Bdu.jpeg",price: 20000),
      MenuModel(name: "Fresh Grilled Sea Food", desc: "Udang, Cumi Dan Kakap Disajikan Dengan Mentega Bawang Putih Dan Saus Cabai", image: "https://bebekbengil.co.id/assets/front/images/fresh-grilled-sea-food-at-bebek-bengil-Jir.jpeg",price: 18250),
    ];

    final List<BusinessHoursModel> businessHoursList = [
      BusinessHoursModel(day: "Senin", openingHour: "10:00", closingHour: "22:00"),
      BusinessHoursModel(day: "Selasa", openingHour: "10:00", closingHour: "22:00"),
      BusinessHoursModel(day: "Rabu", openingHour: "10:00", closingHour: "22:00"),
      BusinessHoursModel(day: "Kamis", openingHour: "10:00", closingHour: "22:00"),
      BusinessHoursModel(day: "Jumat", openingHour: "10:00", closingHour: "22:00"),
      BusinessHoursModel(day: "Sabtu", openingHour: "10:00", closingHour: "22:00"),
      BusinessHoursModel(day: "Minggu", openingHour: "10:00", closingHour: "22:00"),
    ];
    
    
    Widget viewTitle(){
      return Row(
        children: [
          Image.asset("asset/images/img_bebek_bengil.jpeg",width: 60.w,height: 60.w,),
          SizedBox(width: 10.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Restoran Bebek Bengil",style: CustomTextStyle.bold18,),
              SizedBox(height: 4.h,),
              Text("The Original Crispy Duck Since 1990",style: CustomTextStyle.reguler10,),

            ],
          ),
        ],
      );
    }

    Widget viewContact(){
      return Row(
        children: [
          InkWell(
            onTap: () async {
              final mailtoLink = Mailto(
                to: ['om.ubud@bebekbengil.co.id'],
                subject: 'Tanya Seputar Resto',
                body: 'Saya ingin bertanya sesuatu',
              );
              // Convert the Mailto instance into a string.
              // Use either Dart's string interpolation
              // or the toString() method.
              await launchUrl(Uri.parse("$mailtoLink"));
            },
            child: Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                  color: CustomColor.primary500,
                  borderRadius: BorderRadius.circular(8.r)
              ),
              child: FaIcon(FontAwesomeIcons.solidEnvelope,color: CustomColor.white,size: 20.r,),
            ),
          ),
          SizedBox(width: 10.w,),
          InkWell(
            onTap: () async {
              const link = "tel:+62361975489";

              await launchUrl(Uri.parse(link));
            },
            child: Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                  color: CustomColor.primary500,
                  borderRadius: BorderRadius.circular(8.r)
              ),
              child: FaIcon(FontAwesomeIcons.phone,color: CustomColor.white,size: 20.r,),
            ),
          ),
          SizedBox(width: 10.w,),
          InkWell(
            onTap: () async {
              const String udinusLat = "-6.982594788123831";
              const String udinusLng = "110.40923991070949";

              final String googleMapslocationUrl = "https://www.google.com/maps/search/?api=1&query=${udinusLat},${udinusLng}";
              await launchUrl(Uri.parse(googleMapslocationUrl));
            },
            child: Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                  color: CustomColor.primary500,
                  borderRadius: BorderRadius.circular(8.r)
              ),
              child: FaIcon(FontAwesomeIcons.mapLocation,color: CustomColor.white,size: 20.r,),
            ),
          ),



        ],
      );
    }


    Widget viewDescription(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicWidth(
            child: Column(
              children: [
                Text("Tentang Restoran",style: CustomTextStyle.bold20,),
                SizedBox(height: 2.h,),
                Container(
                  height: 2.h,
                  decoration: BoxDecoration(
                    color: CustomColor.primary500
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 10.h,),
          Text("Dibuka pada tahun 1990, Bebek Bengil (Dirty Duck Diner) menyajikan makanan lezat dan menyediakan layanan hebat dalam suasana yang ramah, nyaman dan santai.\n\nBanyak orang yang penasaran dengan nama unik 'BebekBengil' ini. Cerita dimulai ketika kami membangun restoran. Kami berpikir dengan hati-hati untuk memiliki nama baik untuk restoran. Kami menerima beberapa saran, tetapi sepertinya tidak ada yang benar. Kami ingin nama Bali yang diterjemahkan ke dalam bahasa Inggris.\n\nSuatu pagi di musim hujan tropis, ketika restoran itu hampir selesai (kami memiliki lantai beton di bawah, dan meja-meja) sekawanan bebek dari sawah di seberang jalan (... ya, ada sawah di sekitar kita saat itu !) berlari quacking dan squawking ke restoran dan menginjak lantai dan meja. Mereka meninggalkan jejak kaki berlumpur dan berselaput di semua tempat. Mereka adalah tamu pertama kami - \"Bebek Bengil\" ini.",style: CustomTextStyle.reguler12,)
        ],
      );
    }

    Widget viewAlamat(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicWidth(
            child: Column(
              children: [
                Text("Alamat",style: CustomTextStyle.bold20,),
                SizedBox(height: 2.h,),
                Container(
                  height: 2.h,
                  decoration: BoxDecoration(
                      color: CustomColor.primary500
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 10.w,),
          Row(
            children: [
              FaIcon(FontAwesomeIcons.locationDot,size: 20.r,),
              SizedBox(width: 10.w,),
              Expanded(child: Text("Bebek Bengil – Ubud Jalan Hanoman, Padang Tegal, Ubud, Bali 80571 Indonesia",style: CustomTextStyle.reguler12,))
            ],
          )
        ],
      );
    }


    Widget viewBusinessHours(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicWidth(
            child: Column(
              children: [
                Text("Jam Buka",style: CustomTextStyle.bold20,),
                SizedBox(height: 2.h,),
                Container(
                  height: 2.h,
                  decoration: BoxDecoration(
                      color: CustomColor.primary500
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 10.w,),
          ListView.builder(itemBuilder: (context,index){
            return BusinessHoursItem(data: businessHoursList[index]);
          },itemCount: businessHoursList.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),)
        ],
      );
    }

    Widget viewMenu(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicWidth(
            child: Column(
              children: [
                Text("Menu",style: CustomTextStyle.bold20,),
                SizedBox(height: 2.h,),
                Container(
                  height: 2.h,
                  decoration: BoxDecoration(
                      color: CustomColor.primary500
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 10.h,),
          ListView.builder(itemBuilder: (context,index){
            return InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DetailMenuPage(menu: menuList[index])));
                },
                child: MenuItem(data: menuList[index]));
          },itemCount: menuList.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),),
          // CustomGridView(itemCount: menuList.length, itemBuilder: (context,index){
          //   return InkWell(
          //     onTap: (){
          //       Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DetailMenuPage(menu: menuList[index])));
          //     },
          //       child: MenuItem(data: menuList[index]));
          // }, axisCount: 2,margin: 10.w,physics: NeverScrollableScrollPhysics(),)
        ],
      );
    }





    Widget viewMain(){
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              viewTitle(),
              SizedBox(height: 10.h,),
              HomeSlider(list: imageList),
              SizedBox(height: 10.h,),
              viewContact(),
              SizedBox(height: 20.h,),
              viewMenu(),
              viewDescription(),
              SizedBox(height: 20.h,),
              viewAlamat(),
              SizedBox(height: 20.h,),
              viewBusinessHours()



            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(child: viewMain()),
      backgroundColor: CustomColor.white,

    );
  }
}
