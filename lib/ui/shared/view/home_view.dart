import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/core/colors/color_palette.dart';
import 'package:netflix/core/colors/images.dart';

class homeView extends StatefulWidget {
  const homeView({super.key});

  @override
  State<homeView> createState() => _homeViewState();
}

class _homeViewState extends State<homeView> {
  static final colors = AppColors();
  static final images = AppImages();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, child) {
          return Scaffold(
            backgroundColor: Color(colors.bgcolor),
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(20.r),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 0.065.sh),
                          Center(
                            child: Image.asset(
                              images.Logo,
                              width: 0.4.sw,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit),
                            color: Color(colors.colorwhite),
                            iconSize: 0.04.sh,
                          )
                        ],
                      ))
                ],
              ),
            ),
          );
        });
  }
}
