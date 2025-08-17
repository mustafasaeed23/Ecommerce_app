import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.svgIcons,
    this.labels = const ['Home', 'Categories', 'Favorites', 'Profile'],
    this.backgroundColor = const Color(0xFF0C4A74),
    this.activeColor = const Color(0xFF0C4A74),
    this.inactiveColor = Colors.white,
    this.height = 68,
    this.margin = const EdgeInsets.fromLTRB(12, 0, 12, 12),
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    this.borderRadius = 24,
    this.showLabels = false,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<String> svgIcons;
  final List<String> labels;

  final Color backgroundColor;
  final Color activeColor; // icon color when selected (inside white circle)
  final Color inactiveColor; // icon color when not selected

  final double height;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double borderRadius;
  final bool showLabels;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: height,

        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius.r),
            topRight: Radius.circular(borderRadius.r),
          ),
        ),
        child: Row(
          children: List.generate(svgIcons.length, (i) {
            final bool selected = i == currentIndex;

            return Expanded(
              child: InkWell(
                onTap: () => onTap(i),
                borderRadius: BorderRadius.circular(100.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      curve: Curves.easeOut,
                      width: selected ? 44.r : 24.r,
                      height: selected ? 44.r : 24.r,
                      decoration: BoxDecoration(
                        color: selected ? Colors.white : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          svgIcons[i],
                          width: selected ? 24.r : 22.r,
                          height: selected ? 24.r : 22.r,
                          colorFilter: ColorFilter.mode(
                            selected ? activeColor : inactiveColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    if (showLabels) ...[
                      SizedBox(height: 6.h),
                      Text(
                        labels[i],
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.white.withOpacity(selected ? 1 : 0.75),
                          fontWeight: selected
                              ? FontWeight.w600
                              : FontWeight.w400,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
