import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../configurations/styles.dart';

class HotRedditContainer extends StatelessWidget {
  final Widget? child;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? width;
  final double? height;
  final double? radius;
  final Color? color;

  const HotRedditContainer({
    this.child,
    this.verticalPadding,
    this.horizontalPadding,
    this.width,
    this.height,
    this.radius,
    this.color,
    Key? key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) => Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? CommonSizes.MED_LAYOUT_W_GAP.h,
          horizontal:
              horizontalPadding ?? CommonSizes.BIG_LAYOUT_W_GAP.w),
      decoration: BoxDecoration(
        color: color,
          borderRadius: BorderRadius.circular(radius ?? 60.r),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).shadowColor, blurRadius: 4, spreadRadius: -2,)
          ],
      ),
      child: child ?? const SizedBox(),
    );
  }

