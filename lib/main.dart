import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profil_resto/styles/custom_color.dart';
import 'package:profil_resto/ui/home/home_view.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    /** Init Screen Util Agar Tampilan Responsif*/
    return ScreenUtilInit(
        minTextAdapt: false,
        splitScreenMode: false,
        useInheritedMediaQuery: true,
        /** Design Size Bisa Diganti Sesuai Dengan Ukuran Canvas Figma */
        designSize: const Size(375, 812),
        builder: (context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Profil Restoran',
            theme: ThemeData(
              appBarTheme:  AppBarTheme(
                backgroundColor: Colors.white,
                toolbarHeight: 60.h,
                iconTheme: IconThemeData(
                  size: 30.r,
                  color: CustomColor.dark,
                ),
              ),
              primaryColor: CustomColor.primary500,
              primarySwatch: Colors.blue,
              fontFamily: 'Jakarta',),
            home:  HomePage(),
          );
        }
    );
  }
}


