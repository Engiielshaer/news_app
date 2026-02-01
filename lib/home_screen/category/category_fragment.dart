import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/home_screen/category/category_item.dart';
import 'package:news_app/model/Category.dart';

class CategoryFragment extends StatelessWidget {
  var categoriesList=Category.getCategorywithid();
  Function onCategoryItemClick;
    CategoryFragment({super.key,required this.onCategoryItemClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Pick your category \n of interest',
          style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(
            height: MediaQuery.of(context).size.height*.02,
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10
                ),
                itemCount: categoriesList.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      onCategoryItemClick(categoriesList[index]);
                    },
                      child: CategoryItem(index: index, category: categoriesList[index]));
                }),
          )

        ],
      ),
    );
  }
}
