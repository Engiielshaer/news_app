
import 'dart:ui';

import 'package:news_app/utils/app_color.dart';

class Category{
  String id;
  String imagePath;
  String title;
  Color color;


  Category({required this.id,required this.title, required this.imagePath,required this.color});

  //        science  technology

  static List<Category>getCategorywithid(){
    return [
      Category(id: 'sports', title: 'Sports',
          imagePath: 'assets/images/ball.png', color: AppColors.redColor),

      Category(id: 'general', title: 'General',
          imagePath: 'assets/images/Politics.png', color: AppColors.darkBlueColor),

      Category(id: 'health', title: 'Health',
          imagePath: 'assets/images/health.png', color: AppColors.pinkColor),

      Category(id: 'business', title: 'Business',
          imagePath: 'assets/images/bussines.png', color: AppColors.brownColor),

      Category(id: 'entertainment', title: 'Entertainment',
          imagePath: 'assets/images/environment.png', color: AppColors.blueColor),

      Category(id: 'science', title: 'Science',
          imagePath: 'assets/images/science.png', color: AppColors.yellowColor)
    ];
  }
}