import 'package:flutter/material.dart';
import 'package:news_app/model/Category.dart';

class CategoryItem extends StatelessWidget {
  int index;
  Category category;
    CategoryItem({super.key, required this.index,required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topLeft:Radius.circular(25),
          topRight: Radius.circular(25),
          bottomRight:Radius.circular(index %2!=0 ?25 : 0) ,
          bottomLeft:Radius.circular(index %2==0 ?25 :0) ,
        )
      ),
      child: Column(
        children: [
          Image.asset(category.imagePath,
            height: MediaQuery.of(context).size.height*.15,
          ),
          Text(category.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
