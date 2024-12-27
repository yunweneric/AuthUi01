import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_openui/utils/colors.dart';
import 'package:flutter_openui/utils/sizing.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fadeTextAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );

    fadeTextAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );

    Future.delayed(Duration(milliseconds: 700), () => controller.forward());

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    pageController.dispose();
    super.dispose();
  }

  int activeIndex = 0;

  PageController pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Theme(
        data: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          primaryColor: Colors.blue,
          textTheme: const TextTheme(
            displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            displaySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            bodyMedium: TextStyle(fontSize: 16),
          ),
        ),
        child: Builder(builder: (context) {
          final theme = Theme.of(context);
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  AppSizing.k20(context),
                  Center(
                    child: Text(
                      "Hobbyr",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                  AppSizing.k20(context),
                  SizedBox(
                    height: AppSizing.height(context) * 0.5,
                    width: AppSizing.width(context),
                    child: PageView.builder(
                      itemCount: bgClip.length,
                      onPageChanged: (i) {
                        setState(() {
                          activeIndex = i;
                        });
                      },
                      itemBuilder: (c, i) {
                        return Stack(
                          children: [
                            SvgPicture.string(
                              bgClip[0],
                              width: AppSizing.width(context),
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              child: Image.asset(
                                "assets/images/onboarding_$activeIndex.png",
                                width: AppSizing.width(context) / 5,
                                height: AppSizing.height(context) * 0.4,

                                // fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  AppSizing.k20(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(bgClip.length, (i) => i).map((i) {
                        return AnimatedContainer(
                          height: 8,
                          width: activeIndex == i ? 20 : 8,
                          decoration: BoxDecoration(
                            color: activeIndex == i ? theme.primaryColor : theme.highlightColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          margin: const EdgeInsets.only(right: 10),
                          duration: const Duration(milliseconds: 500),
                        );
                      })
                    ],
                  ),
                  AppSizing.k20(context),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          "This is the title of the onboarding",
                          style: theme.textTheme.displayMedium,
                          textAlign: TextAlign.center,
                        ),
                        AppSizing.k20(context),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis",
                          style: theme.textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  AppSizing.k20(context),
                  AppSizing.k20(context),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            bgColor: theme.scaffoldBackgroundColor,
                            textColor: theme.primaryColor,
                            onPressed: () {},
                            title: "Skip",
                          ),
                        ),
                        AppSizing.kwSpacer(context, 0.02),
                        Expanded(
                          child: AppButton(
                            onPressed: () {
                              setState(() {
                                activeIndex += 1;
                              });
                            },
                            title: "Next",
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      );
    });
  }
}

final bgClip = [
  """
<svg width="375" height="304" viewBox="0 0 375 304" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M379.5 10.4999C140.5 54.5 214.5 70.5 -9.15527e-05 10.5C-207.604 192.443 -508.371 365.729 6.10352e-05 281C135 258.5 211 211 379.5 281C444.684 90.5887 632.457 -36.0699 379.5 10.4999Z" fill="#FFE265"/>
</svg>
""",
  """<svg width="375" height="449" viewBox="0 0 375 449" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M419.463 69.6594C182.221 188.383 -84.3985 72.688 -188.053 0C-379.687 168.091 -647.976 473.835 -188.053 352.083C271.869 230.33 485.954 365.964 535.506 449C595.676 273.085 656.706 -49.0644 419.463 69.6594Z" fill="#FFE265"/>
</svg>
""",
  """<svg width="375" height="527" viewBox="0 0 375 527" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M63.101 314.964C322.271 258.305 410.82 448.871 511.05 526.213C710.155 367.041 1035.03 -15.3999 570.029 85.2388C105.03 185.878 -19.9234 85.4301 -65.6346 0.219512C-133.769 173.206 -192.565 370.858 63.101 314.964Z" fill="#FFE265"/>
</svg>
""",
  """<svg width="375" height="417" viewBox="0 0 375 417" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M416.571 74.0935C66.4194 166.029 -37.5065 68.3062 -144.358 0.405407C-328.153 177.034 -582.265 494.659 -128.353 352.124C325.56 209.589 545.589 335.351 598.864 416.048C650.975 237.58 669.696 7.63326 416.571 74.0935Z" fill="#FFE265"/>
</svg>
"""
];

// final clip

class AppButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final Color? bgColor;
  final Color? textColor;
  final Color? disabledBgColor;
  final TextStyle? textStyle;
  final Widget? icon;
  final double? width;
  final bool? isLoading;
  final double? height;
  final bool isDisabled;
  final bool isElevated;
  final BorderSide? side;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;

  const AppButton({
    required this.title,
    required this.onPressed,
    this.bgColor,
    this.textColor,
    this.disabledBgColor,
    this.textStyle,
    this.isLoading,
    this.icon,
    this.side,
    this.width,
    this.height,
    this.padding,
    this.borderRadius,
    this.isDisabled = false,
    this.isElevated = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: isDisabled || isLoading == true ? null : onPressed,
        style: ElevatedButton.styleFrom(
          elevation: isElevated ? null : 0,
          disabledBackgroundColor: disabledBgColor ?? bgColor?.withOpacity(.5),
          backgroundColor: bgColor ?? theme.primaryColor,
          surfaceTintColor: bgColor,
          shape: RoundedRectangleBorder(borderRadius: borderRadius ?? BorderRadius.circular(12), side: side ?? BorderSide.none),
          shadowColor: AppColors.textBlack.withOpacity(.1),
        ),
        child: Padding(
          padding: padding ?? EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: isLoading == true
              ? Center(
                  child: SizedBox(height: 18, width: 18, child: CircularProgressIndicator.adaptive()),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null) ...[
                      icon!,
                      const SizedBox(width: 8),
                    ],
                    Center(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: textStyle ??
                            theme.textTheme.bodyMedium!.copyWith(
                              color: textColor ?? AppColors.textWhite,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class AppColors {
  static const textWhite = Color(0xFFFFFFFF);
  static const bgBlack = Color(0xFF161616);
  static const textBlack = Color(0xFF232323);
  static const bgWhite = Color(0xFFC0C0C0);
}
