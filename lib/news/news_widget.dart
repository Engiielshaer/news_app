
import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/api_manager.dart';
import 'package:news_app/news/news_item.dart';
import 'package:news_app/utils/app_color.dart';

class NewsWidget extends StatefulWidget {
  Source source;
    NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsbySourceid(widget.source.id ??""),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color:AppColors.brimaryLightColor,
              ),
            );
          }else if(snapshot.hasError){
            return Column(
              children: [
                Text('Some thing went wrong'),
                ElevatedButton(onPressed: (){
                  setState(() {
                    ApiManager.getNewsbySourceid(widget.source.id ?? "");
                  });
                  },
                  child: Text('Try again'))
              ],);
          }
          if(snapshot.data!.status !='ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(onPressed: (){

                  setState(() {
                    ApiManager.getNewsbySourceid(widget.source.id ?? "");
                  });
                },
                    child: Text('Try again'))
              ],);
          }
          var newsList=snapshot.data!.articles!;
          return ListView.builder(
              itemBuilder: (context,index){
                return NewsItem(news: newsList[index]);
              },
            itemCount: newsList.length,
              );
        });
  }
}
