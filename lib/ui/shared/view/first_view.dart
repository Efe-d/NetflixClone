// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/core/colors/color_palette.dart';
import 'package:netflix/core/colors/images.dart';

class first_view extends StatelessWidget {
  const first_view({super.key});
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
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color(colors.bgcolor),
              unselectedItemColor: Colors.grey,
              selectedItemColor: Color(colors.colorwhite),
              onTap: (value) {},
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Settings'),
              ],
            ),
            backgroundColor: Color(colors.bgcolor),
            body: Container(
              child: ListView(
                children: [
                  Column(
                    children: [
                      C1(images: images, colors: colors),
                      C2(colors: colors),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Previews',
                              style: TextStyle(
                                  color: Color(colors.colorwhite),
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }
}

class C2 extends StatelessWidget {
  const C2({
    Key? key,
    required this.colors,
  }) : super(key: key);

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      ButtonColumn(
        colors: colors,
        icon: 0xe047,
        text: 'My List',
      ),
      Container(
        width: 0.3.sw,
        height: 0.09.sh,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      CupertinoPageRoute(builder: (ctx) => const first_view()));
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                        size: 45.sp,
                      ),
                      Text(
                        'Play',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ])),
          ],
        ),
      ),
      ButtonColumn(
        colors: colors,
        icon: 0xe33d,
        text: 'Info',
      ),
    ]);
  }
}

class ButtonColumn extends StatelessWidget {
  final icon;
  final String text;
  const ButtonColumn({
    Key? key,
    required this.colors,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButtons(
          colors: colors,
          icon: icon,
        ),
        ButtonText(
          colors: colors,
          text: text,
        ),
      ],
    );
  }
}

class ButtonText extends StatelessWidget {
  final String text;
  const ButtonText({
    Key? key,
    required this.colors,
    required this.text,
  }) : super(key: key);

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Color(colors.colorwhite), fontSize: 20.sp),
      textAlign: TextAlign.center,
    );
  }
}

class IconButtons extends StatelessWidget {
  final icon;
  const IconButtons({
    Key? key,
    required this.icon,
    required this.colors,
  }) : super(key: key);

  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        IconData(icon, fontFamily: 'MaterialIcons'),
        color: Color(colors.colorwhite),
        size: 40.sp,
      ),
    );
  }
}

class C1 extends StatelessWidget {
  const C1({
    Key? key,
    required this.images,
    required this.colors,
  }) : super(key: key);

  final AppImages images;
  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 0.6.sh,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(images.topfilm),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.03.sw,
            vertical: 0.1.sw,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(images.IconLogo),
                  TopBarButtons(text: 'Tv Shows'),
                  TopBarButtons(text: 'Movies'),
                  TopBarButtons(text: 'My List'),
                ],
              ),
              Text('#2 in France Today',
                  style: TextStyle(
                    color: Color(colors.colorwhite),
                    fontSize: 20.sp,
                  )),
            ],
          )),
    );
  }
}

class TopBarButtons extends StatelessWidget {
  final String text;
  const TopBarButtons({
    Key? key,
    this.text = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: CustomText(
        text: text,
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  const CustomText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          color: Color(first_view.colors.colorwhite),
          fontSize: 18.sp,
        ));
  }
}
