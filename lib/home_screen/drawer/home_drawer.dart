import 'package:flutter/material.dart';
import 'package:news_app/utils/app_color.dart';

class HomeDrawer extends StatelessWidget{
  Function onDrawerItemClick;
  static const int categories=1;
  static const int settings=2;
    HomeDrawer({super.key, required this.onDrawerItemClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*.20,
            color: AppColors.brimaryLightColor,
            alignment: Alignment.center,
            child: Text(
              'News App!',
              // textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:20,left: 10,right: 10),
            child: InkWell(
              onTap: (){
                onDrawerItemClick(categories);
              },
              child: Row(
                children: [
                  Icon(Icons.list),
                  SizedBox(width: MediaQuery.of(context).size.width*.03,),
                  Text('Categories',
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: (){
                onDrawerItemClick(settings);
              },
              child: Row(
                children: [
                  Icon(Icons.settings),
                  SizedBox(width: MediaQuery.of(context).size.width*.03,),
                  Text('Settings',
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
