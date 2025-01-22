import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:stroll/features/dashboard/bonfire/presentation/views/bonfire.dart';
import 'package:stroll/features/dashboard/card/presentation/views/card_screen.dart';
import 'package:stroll/features/dashboard/chats/presentation/views/chats.dart';
import 'package:stroll/features/dashboard/profile/presentation/views/profile.dart';

import '../common/custom_text.dart';
import '../constants/nav_provider.dart';
import '../theme/color.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Widget> navScreens() {
    return [
      const CardScreen(),
      const Bonfire(),
      const ChatsScreen(),
      const Profile(),
    ];
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration.zero, () => context.read<NavState>().selectedItem = 0);
  }

  Widget buildNavItem({
    required bool item,
    required String icon,
    required VoidCallback onTap,
  int? badgeCount,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  SvgPicture.asset(
                    icon,
                    height: 44.h,
                    width: 44.w,
                    color: AppColors.iconColor,
                    fit: BoxFit.scaleDown,
                  ),
                  if (badgeCount != null && badgeCount > 0)
                    Positioned(
                    left: 28.w,
                      top: 8.h,
                      child: Container(
                    height: 13.h,
                    width: 16.w,
                    decoration: BoxDecoration(
                      color: AppColors.borderColor,
                      borderRadius: BorderRadius.circular(15.w),
                    ),
                        child:   Center(
                          child: CustomText(
                            inputText: badgeCount.toString(),
                            textAlign: TextAlign.start,
                            fontSize:7,
                            weight: FontWeight.w700,
                            color: AppColors.bottomNavColor,
                          ),
                        ),
                  ))
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NavState>();
    return Scaffold(
      bottomNavigationBar: Container(
        height: 79.h,
        decoration: const BoxDecoration(
          color: AppColors.bottomNavColor,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 24.0.w,
            right: 24.w,
            top: 16.h,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildNavItem(
                badgeCount: 0,
                icon: 'assets/images/Card.svg',
                onTap: () {
                  model.selectedItem = 0;
                },
                item: model.index == 0,
              ),
              buildNavItem(
                badgeCount: 1,
                  icon: 'assets/images/bonfire.svg',
                  item: model.index == 1,
                  onTap: () {
                    model.selectedItem = 1;
                  }),
              buildNavItem(
                  icon: 'assets/images/Chat.svg',
                  badgeCount: 10,
                  item: model.index == 2,
                  onTap: () {
                    model.selectedItem = 2;
                  }),
              buildNavItem(
                  icon: 'assets/images/User.svg',
                  item: model.index == 3,
                  onTap: () {
                    model.selectedItem = 3;
                  })
            ],
          ),
        ),
      ),
      body: navScreens()[model.index],
    );
  }
}
