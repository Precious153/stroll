import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/custom_text.dart';
import '../../../../theme/color.dart';


class OptionTile extends StatefulWidget {
  const OptionTile({
    super.key,
    required this.option,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String option;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<OptionTile> createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 166.w,
        decoration: BoxDecoration(
          color: AppColors.containerColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: widget.isSelected ? AppColors.borderColor : AppColors.containerColor,
            width: widget.isSelected ? 1 : 1,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 13.5.h),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color:  widget.isSelected
                      ? AppColors.borderColor
                      : Colors.transparent,
                  border: Border.all(
                    color:  AppColors.textColor2,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: EdgeInsets.all(6.0.sp),
                  child: CustomText(
                    inputText: widget.option,
                    textAlign: TextAlign.start,
                    fontSize: 12,
                    weight: FontWeight.w600,
                    color: widget.isSelected
                        ? AppColors.primaryColor
                        : AppColors.textColor2,
                  ),
                ),
              ),
              SizedBox(width: 9.w),
              Expanded(
                child: CustomText(
                  inputText: widget.title,
                  textAlign: TextAlign.start,
                  fontSize: 12,
                  weight: FontWeight.w600,
                  color: widget.isSelected
                      ? AppColors.textColor2
                      : AppColors.textColor2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}