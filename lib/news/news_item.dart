
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/utils/app_color.dart';


class NewsItem extends StatelessWidget {
  News news;
    NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(8),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl:news.urlToImage??"",
              width: double.infinity,
              height: MediaQuery.of(context).size.height*.3,
              fit: BoxFit.fill,
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: AppColors.brimaryLightColor,
                  )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          SizedBox(height: 10,),
          Text(news.author??'',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.greyColor,fontSize: 15),
          ),
          SizedBox(height: 10,),
          Text(news.title??'',
          style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: 10,),
          Text(formatDate(news.publishedAt??''),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.greyColor,fontSize: 14),textAlign: TextAlign.end,)
        ],
      ),
    );
  }
}


String formatDate(String publishedAt) {
  DateTime date = DateTime.parse(publishedAt).toLocal();
  return DateFormat('dd MMM yyyy • hh:mm a')
      .format(date);
}
