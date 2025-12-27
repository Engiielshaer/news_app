import 'package:flutter/material.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/api_manager.dart';
import 'package:news_app/tabs/tab_widget.dart';
import 'package:news_app/utils/app_color.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
      future:ApiManager.getSources(),
      builder:(context,snapshot){
        if(snapshot.connectionState== ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(
            color: AppColors.brimaryLightColor,
          ));
        }else if(snapshot.hasError) {
          return Column(
            children: [
              Text('something went wrong'),
              ElevatedButton(onPressed: (){
                ApiManager.getSources();
                setState(() {

                });}, child: Text('Try again'))
            ],
          );
        }
        if(snapshot.data!.status != 'ok'){
          return Column(
            children: [
              Text(snapshot.data!.message!),
              ElevatedButton(onPressed: (){
                ApiManager.getSources();
                setState(() {

                });
              }, child: Text('Try again'))
            ],
          );
        }
        var sourceList=snapshot.data!.sources!;
        return TabWidget(sourceList: sourceList);

      } ,
    );
  }
}
