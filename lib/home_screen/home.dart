
import 'package:flutter/material.dart';
import 'package:news_app/home_screen/category/category_details.dart';
import 'package:news_app/home_screen/category/category_fragment.dart';
import 'package:news_app/home_screen/drawer/home_drawer.dart';
import 'package:news_app/home_screen/settings/settings.dart';
import 'package:news_app/model/Category.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/api_manager.dart';
import 'package:news_app/tabs/tab_widget.dart';
import 'package:news_app/utils/app_color.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName='homeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.whiteColor,
          child: Image.asset(
              'assets/images/main_background.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text( selectedDrawerItem== HomeDrawer.settings ?'settings' :
                selectedCategory==null ?
              'News App' : selectedCategory!.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
              iconTheme: IconThemeData(color:AppColors.whiteColor)
          ),
          drawer:Drawer(
            child: HomeDrawer(onDrawerItemClick:onDrawerItemClick ,),
          ),

          body:selectedDrawerItem == HomeDrawer.settings ?
              SettingsTab() :
          selectedCategory ==null ?
          CategoryFragment(onCategoryItemClick:onCategoryItemClick ,):
          CategoryDetails(category: selectedCategory!),
        )
      ],);
  }
  Category? selectedCategory;
  void onCategoryItemClick(Category newCategory){
    selectedCategory = newCategory;
    setState(() {});
  }

  int selectedDrawerItem=HomeDrawer.categories;
  void onDrawerItemClick(int newSelectedDrawerItem){
    selectedDrawerItem = newSelectedDrawerItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {

    });
  }
}
