import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/core/colors/color_palette.dart';
import 'package:netflix/core/colors/images.dart';
import 'package:netflix/ui/shared/view/first_view.dart';

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
                  TopBar(images: images, colors: colors),
                  Profiles(images: images, colors: colors),
                  //Add profile i column içine 3. bir row açarak ekle
                  AddProfile(images: images, colors: colors)
                ],
              ),
            ),
          );
        });
  }
}

class Profiles extends StatelessWidget {
  const Profiles({
    Key? key,
    required this.images,
    required this.colors,
  }) : super(key: key);

  final AppImages images;
  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 0.5.sh,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(
              CupertinoPageRoute(builder: (ctx) => const first_view()));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileRow(images: images, colors: colors),
            ProfileRow(images: images, colors: colors),
          ],
        ),
      ),
    );
  }
}

class ProfileRow extends StatelessWidget {
  const ProfileRow({
    Key? key,
    required this.images,
    required this.colors,
  }) : super(key: key);

  final AppImages images;
  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Profile(images: images, colors: colors),
          Profile(images: images, colors: colors),
        ]);
  }
}

class AddProfile extends StatelessWidget {
  const AddProfile({
    Key? key,
    required this.images,
    required this.colors,
  }) : super(key: key);

  final AppImages images;
  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(8.r),
          child: Column(
            children: [
              Image.asset(images.ProfileAdd),
              Text(
                'Test1',
                style: TextStyle(color: Color(colors.colorwhite)),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
    required this.images,
    required this.colors,
  }) : super(key: key);

  final AppImages images;
  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.r),
        child: Column(
          children: [
            Image.asset(
              images.ProfileImage,
            ),
            Text(
              'Test1',
              style: TextStyle(color: Color(colors.colorwhite)),
            ),
          ],
        ));
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
    required this.images,
    required this.colors,
  }) : super(key: key);

  final AppImages images;
  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ));
  }
}
