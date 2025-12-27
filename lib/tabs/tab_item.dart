
import 'package:flutter/material.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/utils/app_theme.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  Source source;
    TabItem({super.key, required this.isSelected,required this.source});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(7),
      margin: const EdgeInsets.only(top: 7),
      decoration: BoxDecoration(
        color: isSelected? AppColors.brimaryLightColor :Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: AppColors.brimaryLightColor,
          width: 2,
        ),
      ),
      child: Text(
        source.name?? '' ,
        style:Theme.of(context).textTheme.titleMedium?.copyWith(
          color: isSelected? AppColors.whiteColor: AppColors.brimaryLightColor
        ),
      ),
    );
  }
}
