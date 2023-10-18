import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../styles/custom_color.dart';
import '../styles/custom_text_style.dart';




extension StringExtension on String {

  String capitalize(){
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
  String capitalizeByWord() {
    if (trim().isEmpty) {
      return '';
    }
    return split(' ')
        .map((element) =>
    "${element[0].toUpperCase()}${element.substring(1).toLowerCase()}")
        .join(" ");
  }

  String convertDate({String dari = "yyyy-MM-dd HH:mm", required String ke}){
    try{
      DateTime tempDate = DateFormat(dari).parse(this);
      return DateFormat(ke,"id").format(tempDate);
    }catch(e){
      return this;
    }

  }

  String formatJam(){
    String p = "";
    String jam = convertDate(dari: "HH:mm:ss", ke: "HH");
    String menit = convertDate(dari: "HH:mm:ss", ke: "mm");
    String detik = convertDate(dari: "HH:mm:ss", ke: "ss");

    if(jam != "00"){
      p += "${jam} jam ";
    }

    if(menit != "00" ){
      p += "${menit} menit ";

    }

    if(detik != "00" ){
      p += "${detik} detik";
    }

    return p;
  }


  DateTime toDateTime({required String dari}){
    try{
      DateTime tempDate = DateFormat(dari).parse(this);
      return tempDate;

    }catch(e){
      return DateTime.now();
    }
  }






}


extension IntExtension on int {
  String convertRupiah() {
    try{
      final formatCurrency = NumberFormat.simpleCurrency(locale: 'id_ID');
      return formatCurrency.format(this);
    } catch(e){
      return toString();
    }

  }

}

extension TextEntension on Text{
  Widget required(){
    return Row(
      children: [
        this,
        SizedBox(width: 5.w,),
        Text("*",style: CustomTextStyle.reguler12.copyWith(color: CustomColor.error500),)
      ],
    );
  }
}