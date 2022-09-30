import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/core/colors/color_palette.dart';
import 'package:netflix/core/colors/images.dart';
import 'package:netflix/ui/shared/view/home_view.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  static final colors = AppColors();
  static final images = AppImages();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5)).then((value) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (ctx) => const homeView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: Color(colors.bgcolor),
          body: Center(
            child: Image.asset(images.Logo),
          ),
        );
      },
    );
  }
}
