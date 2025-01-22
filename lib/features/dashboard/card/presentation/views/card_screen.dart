import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroll/features/theme/color.dart';

import '../../../../common/custom_text.dart';
import '../widgets/tiles.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  String? selectedOption;

  final List<Map<String, String>> options = [
    {'option': 'A', 'title': 'The peace in the early mornings'},
    {'option': 'B', 'title': 'The calm of afternoon tea'},
    {'option': 'C', 'title': 'The quiet of evening walks'},
    {'option': 'D', 'title': 'The stillness of night time'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill, // Ensures the image covers the entire container
          ),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(

            children: [
              SizedBox(height: 58.h,),
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      inputText: 'Stroll Bonfire',
                      textAlign: TextAlign.start,
                      fontSize:34,
                      weight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                    const Icon(Icons.keyboard_arrow_down,color: AppColors.primaryColor,),
                  ],
                ),
              ),
              SizedBox(height: 3.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/Vector.png',height: 15.h,),
                  SizedBox(width: 3.25.w,),
                  CustomText(
                    inputText: '22h 00m',
                    textAlign: TextAlign.start,
                    fontSize:12,
                    weight: FontWeight.w600,
                    color: AppColors.whiteColor,
                  ),
                  SizedBox(width: 10.w,),
                  Image.asset('assets/images/Vector (1).png',height: 15.h,),
                  SizedBox(width: 3.25.w,),
                  CustomText(
                    inputText: '103',
                    textAlign: TextAlign.start,
                    fontSize:12,
                    weight: FontWeight.w600,
                    color: AppColors.whiteColor,
                  ),

                ],
              ),
              SizedBox(height: 280.h,),
              Padding(
                padding:  EdgeInsets.only(left: 11.0.w),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/Photo.png',height:70.h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          inputText: 'Angelina, 28',
                          textAlign: TextAlign.start,
                          fontSize:11,
                          weight: FontWeight.w700,
                          color: AppColors.whiteColor,
                        ),
                        CustomText(
                          inputText: 'What is your favorite time\nof the day?',
                          textAlign: TextAlign.start,
                          fontSize:20,
                          weight: FontWeight.w700,
                          color: AppColors.whiteColor,
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(height: 9.h,),
              CustomText(
                fontStyle: FontStyle.italic,
                inputText: '“Mine is definitely the peace in the morning.”',
                textAlign: TextAlign.center,
                fontSize:11,
                weight: FontWeight.w700,
                color: AppColors.primaryColor.withOpacity(0.7),
              ),
              SizedBox(height: 14.h,),
          Wrap(
            spacing:12.w,
            children: options.map((item) => Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: OptionTile(
                option: item['option']!,
                title: item['title']!,
                isSelected: selectedOption == item['option'],
                onTap: () {
                  setState(() {
                    selectedOption = item['option'];
                  });
                },
              ),
            )).toList(),
          ),
              const Spacer(),
              Row(
                children: [
                  CustomText(
                    inputText: 'Pick your option.\nSee who has a similar mind.',
                    textAlign: TextAlign.start,
                    fontSize:12,
                    weight: FontWeight.w600,
                    color: AppColors.whiteColor,
                  ),
                  const Spacer(),
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:AppColors.borderColor,
                          width: 1,
                        ),
                        shape: BoxShape.circle
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 13.0.w,vertical: 8.h),
                        child: Image.asset('assets/images/mic.png',height: 18.1.sp,),
                      )),
                  SizedBox(width: 8.w,),
                  Container(
                      decoration: BoxDecoration(
                        color: AppColors.borderColor,
                        border: Border.all(
                          color:AppColors.borderColor,
                          width: 1,
                        ),
                        shape: BoxShape.circle
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 13.0.w,vertical: 8.h),
                        child:Icon(Icons.arrow_forward,color: AppColors.iconColor1,),
                      )),
                ],
              ),
              SizedBox(height: 7.h,),
            ],
          ),
        ),
      ),
    );
  }
}
